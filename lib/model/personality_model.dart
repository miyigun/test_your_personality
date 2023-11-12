import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/controller/data.dart';

class PersonalityModel  extends ChangeNotifier {
  List<int> selectedOption=selectOptionList;

  void changeSelectOption(int? value,int index) {
    selectedOption[index]=value!;

    debugPrint(index.toString());
    debugPrint(selectedOption[index].toString());

    notifyListeners();
  }

  int showSelectedOption(int index){
    return selectedOption[index];
  }
}

final statePersonalityModel = StateProvider<PersonalityModel>((ref) {
  return PersonalityModel();
});
