import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/model/personality_model.dart';

void increaseIndex(WidgetRef ref) {
  final statePersonalityModelIndex = ref.read(statePersonalityModel.notifier).state;
  statePersonalityModelIndex.index++;
}

void selectedOption(WidgetRef ref,int? value,int index) {
  final statePersonalityModelSelectedOptionRead = ref.read(statePersonalityModel.notifier).state;
  final statePersonalityModelSelectedOptionWatch = ref.watch(statePersonalityModel);
  statePersonalityModelSelectedOptionRead.selectedOption[index]=value!;
  debugPrint(statePersonalityModelSelectedOptionRead.selectedOption[index].toString());
  debugPrint(statePersonalityModelSelectedOptionWatch.selectedOption[index].toString());
}
