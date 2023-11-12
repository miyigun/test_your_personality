import 'package:flutter/material.dart';
import 'package:test_your_personality/controller/data.dart';

class PersonalityModel extends ChangeNotifier {
  List<int?> _selectedOption = [];

  bool isChanged=false;

  void getData() {
    if (_selectedOption.isNotEmpty) {
      return;
    }
    _selectedOption = selectOptionList;

    notifyListeners();
  }

  List<int?> getSelectedOptionList() {
    return _selectedOption;
  }

  void changeSelectedOption(int? value, int index) {
    _selectedOption[index] = value!;

    notifyListeners();
  }

  int? showSelectedOption(int index) {
    return _selectedOption[index];
  }

  bool isChangedTrue(){
    isChanged=true;

    return isChanged;
  }
}
