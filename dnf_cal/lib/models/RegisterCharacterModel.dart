import 'package:dnf_cal/models/SearchCharacterModel.dart';
import 'package:dnf_cal/utils/APIModel.dart';
import 'package:dnf_cal/widgets/RegisterCharacterPage/CharacterProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:dnf_cal/realm/Chracter.dart';

class RegisterCharacterModel with ChangeNotifier {
  bool _isEditing = false;
  bool _isEmpty = false;
  final Realm _realm;
  List<Character> _characterList = [];

  RegisterCharacterModel()
      : _realm = Realm(Configuration.local([Character.schema]));

  bool get isEditing => _isEditing;
  bool get isEmpty => _isEmpty;
  List<Character> get characterList => _characterList;

  toggleEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  // realm에 저장되있는 chracter 리스트를 가져와 _characterList에 저장한다.
  loadCharacterList() {
    _characterList = _realm.all<Character>().toList();
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
    notifyListeners();
  }

  Future<void> addCharacter(SearchCharacterModel info) async {
    await APIModel.fetchCharacterFromApi(info);
    _characterList = _realm.all<Character>().toList();
    _isEmpty = false;
    notifyListeners();
  }
}
