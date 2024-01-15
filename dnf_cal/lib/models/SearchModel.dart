import 'package:flutter/material.dart';

class SearchModel with ChangeNotifier {
  String _inputText = "";
  bool _isSubmitted = false;
  final _fieldText = TextEditingController();

  String get inputText => _inputText;
  bool get isSubmitted => _isSubmitted;
  TextEditingController get fieldText => _fieldText;

  void setSubmitted(bool isSubmitted) {
    _isSubmitted = isSubmitted;
    notifyListeners();
  }

  void setInputText() {
    _inputText = "";
    notifyListeners();
  }

  void clearText() {
    _fieldText.clear();
  }
}