import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/controller/data.dart';

class PersonalityModel  extends ChangeNotifier {
  List<String> question;
  List<int> degree;
  int index;
  List<int> selectedOption;

  PersonalityModel(this.question, this.degree, this.index, this.selectedOption);

  void changeSelectOption(int select, int ind){
    selectedOption[ind]=select;

    notifyListeners();
  }
}

final statePersonalityModel = StateProvider<PersonalityModel>((ref) {
  return PersonalityModel(questions, degreeList, 1, selectOptionList);
});
