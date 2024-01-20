import 'package:dnf_cal/widgets/RegisterCharacterPage/CharacterProfile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterCharacterModel with ChangeNotifier {
  bool _isEditing = false;

  bool get isEditing => _isEditing;

  toggleEditing() {
    _isEditing = !_isEditing;
    notifyListeners();
  }
}
