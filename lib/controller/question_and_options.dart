import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/controller/controller.dart';
import 'package:test_your_personality/controller/data.dart';
import 'package:test_your_personality/model/personality_model.dart';

class QuestionAndOptionsWidget extends ConsumerWidget {
  const QuestionAndOptionsWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var statePersonalityModelIndex = ref.read(statePersonalityModel.notifier).state.selectedOption[index];
    var statePersonalityModelIndexWatch = ref.watch(statePersonalityModel).selectedOption[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Text('${index+1}- ${questions[index]}'),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int radioIndex = 1; radioIndex < 7; radioIndex++)
              SizedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio(
                      value: radioIndex,
                      groupValue: statePersonalityModelIndexWatch,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        statePersonalityModelIndex = value!;
                        selectedOption(ref,value,index);
                        debugPrint(statePersonalityModelIndex.toString());
                        debugPrint(statePersonalityModelIndexWatch.toString());
                        },
                    ),
                    Text('${radioIndex-1}'),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
