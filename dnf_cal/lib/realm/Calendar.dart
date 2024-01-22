import 'package:realm/realm.dart';
import 'package:dnf_cal/realm/Character.dart';

part 'Calendar.g.dart';

@RealmModel()
class _Calendar {
  @PrimaryKey()
  late final String date;

  int? year;
  int? month;
  int? day;
  int? hour;
  int? miniute;
  int? itemLevel;
  late List<$Character> characterList;
}
