import 'package:dnf_cal/models/SearchCharacterModel.dart';
import 'package:dnf_cal/utils/APIModel.dart';
import 'package:dnf_cal/widgets/RegisterCharacterPage/CharacterProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:dnf_cal/realm/Character.dart';
import 'package:dnf_cal/realm/Calendar.dart';

class RegisterCharacterModel with ChangeNotifier {
  bool _isEditing = false;
  bool _isEmpty = false;
  final Realm _realm;
  String _lastUpdate = "";
  List<Character> _characterList = [];
  Map<DateTime, List> _itemLevel = {};

  RegisterCharacterModel()
      : _realm =
            Realm(Configuration.local([Character.schema, Calendar.schema]));

  bool get isEditing => _isEditing;
  bool get isEmpty => _isEmpty;
  List<Character> get characterList => _characterList;
  Map<DateTime, List> get itemLevel => _itemLevel;
  String get lastUpdate => _lastUpdate;
  Realm get realm => _realm;

  toggleEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  Future<void> loadItemLevel() async {
    // itemLevel을 저장하는 과정중에 가장 마지막 날짜를 저장한다.
    _itemLevel = _realm.all<Calendar>().toList().fold({}, (map, calendar) {
      map[DateTime.utc(
          calendar.year ?? 0, calendar.month ?? 0, calendar.day ?? 0)] = [
        calendar.itemLevel
      ];
      return map;
    });
    // 마지막 날짜를 저장한다.
    _lastUpdate =
        _realm.all<Calendar>().toList().fold("", (lastUpdate, calendar) {
      return "${calendar.year}-${calendar.month}-${calendar.day}-${calendar.hour}:${calendar.miniute}";
    });
    notifyListeners();
  }

  // realm에 저장되있는 chracter 리스트의 characterId를 이용해 API를 호출하여 정보를 갱신한다.
  Future<void> updateCharacterList() async {
    for (Character character in _characterList) {
      List<SearchCharacterModel> info = await APIModel.fetchDataFromApi(
        character.characterName ?? "",
        character.serverId ?? "",
      );
      await APIModel.fetchCharacterFromApi(info[0]);
    }
    _characterList = _realm.all<Character>().toList();
    // 현재 year, month, day, hour, miniute를 가져온다.
    DateTime now = DateTime.now();
    // CharacterList를 순회하며 총합템레벨의 평균을 구한다.
    int totalItemLevel = _characterList.fold(0, (sum, character) {
      return sum + (character.totalItemLevel ?? 0);
    });
    int averageItemLevel = totalItemLevel ~/ _characterList.length;
    // 위에서 구한 정보를 바탕으로 Calendar에 저장한다.
    // 오늘 날짜(년, 월, 일)에 이미 저장된 정보가 있는지 검사
    List<String> characterIdList = [];
    List<String> characterNameList = [];
    List<String> characterGuildNameList = [];
    List<int> characterItemLevelList = [];
    List<int> characterFameList = [];
    List<String> characterServerIdList = [];
    for (Character character in _characterList) {
      characterIdList.add(character.characterId ?? "");
      characterNameList.add(character.characterName ?? "");
      characterGuildNameList.add(character.guildName ?? "");
      characterItemLevelList.add(character.totalItemLevel ?? 0);
      characterFameList.add(character.fame ?? 0);
      characterServerIdList.add(character.serverId ?? "");
    }
    Calendar? calendar =
        _realm.find<Calendar>('${now.year}-${now.month}-${now.day}');
    if (calendar == null) {
      calendar = Calendar('${now.year}-${now.month}-${now.day}');
      calendar.year = now.year;
      calendar.month = now.month;
      calendar.day = now.day;
      calendar.hour = now.hour;
      calendar.miniute = now.minute;
      calendar.itemLevel = averageItemLevel;
      calendar.characterIdList.addAll(characterIdList);
      calendar.characterNameList.addAll(characterNameList);
      calendar.characterGuildNameList.addAll(characterGuildNameList);
      calendar.characterItemLevelList.addAll(characterItemLevelList);
      calendar.characterFameList.addAll(characterFameList);
      calendar.characterServerIdList.addAll(characterServerIdList);
      _realm.write(() {
        _realm.add(calendar as Calendar);
      });
    } else {
      _realm.write(() {
        calendar!.year = now.year;
        calendar.month = now.month;
        calendar.day = now.day;
        calendar.hour = now.hour;
        calendar.miniute = now.minute;
        calendar.itemLevel = averageItemLevel;
        calendar.characterIdList.clear();
        calendar.characterNameList.clear();
        calendar.characterGuildNameList.clear();
        calendar.characterItemLevelList.clear();
        calendar.characterFameList.clear();
        calendar.characterServerIdList.clear();
        calendar.characterIdList.addAll(characterIdList);
        calendar.characterNameList.addAll(characterNameList);
        calendar.characterGuildNameList.addAll(characterGuildNameList);
        calendar.characterItemLevelList.addAll(characterItemLevelList);
        calendar.characterFameList.addAll(characterFameList);
        calendar.characterServerIdList.addAll(characterServerIdList);
      });
    }
    // Calendar에 저장된 정보를 가져와 _itemLevel에 저장한다.
    loadItemLevel();
    notifyListeners();
  }

  // realm에 저장되있는 chracter 리스트를 가져와 _characterList에 저장한다.
  Future<void> loadCharacterList() async {
    _characterList = _realm.all<Character>().toList();
    notifyListeners();
  }

  // realm에 저장되있는 chracter 중 id가 일치하는 chracter를 삭제한다.
  deleteCharacter(String id) {
    _realm.write(() {
      var chracater = _realm.find<Character>(id);
      if (chracater != null) {
        _realm.delete<Character>(chracater);
      }
    });
    loadCharacterList();
    if (characterList.isEmpty) {
      _isEmpty = true;
    }
    _isEditing = false;
    notifyListeners();
  }

  Future<void> addCharacter(SearchCharacterModel info) async {
    await APIModel.fetchCharacterFromApi(info);
    // 모험단 이름을 찾아올 때 비어있는 index를 참조하지 않도록 1초 대기
    await Future.delayed(Duration(seconds: 1));
    _characterList = _realm.all<Character>().toList();
    notifyListeners();
    if (characterList.isNotEmpty) {
      _isEmpty = false;
    }
    notifyListeners();
  }
}
