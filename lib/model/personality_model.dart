import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/controller/data.dart';

class PersonalityModel {
  String question;
  int degree;
  int index;
  int selectedOption;

  PersonalityModel(this.question, this.degree, this.index, this.selectedOption);
}

final statePersonalityModel = StateProvider<PersonalityModel>((ref) {
  return PersonalityModel(questions[0],0,1,1);
});

