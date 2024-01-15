import 'package:flutter/material.dart';

class SearchModel with ChangeNotifier {
  String _inputText = "";
  bool _isSubmitted = false;

  String get inputText => _inputText;
  bool get isSubmitted => _isSubmitted;

  void setSubmitted(bool isSubmitted) {
    _isSubmitted = isSubmitted;
    notifyListeners();
  }
}