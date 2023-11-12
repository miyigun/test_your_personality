import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/controller/data.dart';
import 'package:test_your_personality/view/test_screen.dart';

//final controller= ChangeNotifierProvider((ref) => PersonalityModel());

class QuestionAndOptionsWidget extends ConsumerWidget {
  const QuestionAndOptionsWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var read = ref.read(controller.notifier);
    read.getData();

    var watch = ref.watch(controller);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Text('${index + 1}- ${questions[index]}'),
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
                        groupValue: watch
                            .showSelectedOption(index),
                        activeColor: Colors.red,
                        onChanged: (int? value) {
                          //statePersonalityModelRead.changeSelectedOption(value!, index);
                          WidgetsBinding.instance
                              .addPostFrameCallback((timeStamp) {
                            if (watch
                                .getSelectedOptionList()
                                .isEmpty) {
                              read.getData();
                              read
                                  .changeSelectedOption(value!, index);
                              //debugPrint(statePersonalityModelWatch.getSelectedOptionList().toString());
                              //debugPrint(statePersonalityModelWatch.showSelectedOption(index).toString());
                              return;
                            }
                            read
                                .changeSelectedOption(value!, index);
                            debugPrint(watch
                                .showSelectedOption(index)
                                .toString());
                            read.isChangedTrue();
                          });

                          //statePersonalityModelRead.changeSelectOption(value, index);
                        }),
                    Text('${radioIndex - 1}'),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}
