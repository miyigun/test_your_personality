import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/model/personality_model.dart';

void increaseIndex(WidgetRef ref) {
  final statePersonalityModelIndex = ref.read(statePersonalityModel.notifier).state;
  statePersonalityModelIndex.index++;
}

void selectedOption(WidgetRef ref,int value,int index) {
  final statePersonalityModelSelectedOption = ref.read(statePersonalityModel.notifier).state;
  statePersonalityModelSelectedOption.selectedOption[index]=value;
  //debugPrint(statePersonalityModelSelectedOption.selectedOption[index].toString());
}
