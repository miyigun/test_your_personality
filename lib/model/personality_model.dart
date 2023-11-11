import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/controller/data.dart';

class PersonalityModel {
  List<String> question;
  List<int> degree;
  int index;
  List<int> selectedOption;

  PersonalityModel(this.question, this.degree, this.index, this.selectedOption);
}

final statePersonalityModel = StateProvider<PersonalityModel>((ref) {
  return PersonalityModel(questions, degreeList, 1, selectOptionList);
});
