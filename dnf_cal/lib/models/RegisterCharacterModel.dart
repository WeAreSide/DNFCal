import 'package:dnf_cal/widgets/RegisterCharacterPage/CharacterProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterCharacterModel with ChangeNotifier {
  bool _isEditing = false;
  List<int> _items = List.generate(5, (index) => index);

  bool get isEditing => _isEditing;
  List<int> get items => _items;

  toggleEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }

  removeItem(id) {
    _items.removeWhere((item) => item == id);
    notifyListeners();
  }
}
