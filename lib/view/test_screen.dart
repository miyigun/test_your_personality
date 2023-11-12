import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/controller/data.dart';
import 'package:test_your_personality/controller/question_and_options.dart';
import 'package:test_your_personality/model/personality_model.dart';

final controller = ChangeNotifierProvider((ref) => PersonalityModel());

class TestScreen extends ConsumerWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(controller);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Test Your Personality...',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          backgroundColor: const Color(0x0000007d),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              const Text(
                'You need to answer a few questions',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(
                height: 10,
              ),
              for (int index = 0; index < questions.length; index++)
                QuestionAndOptionsWidget(index: index),
              Visibility(
                visible: watch.isChanged,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.3),
                  child: ElevatedButton(
                      onPressed: () {
                        if (!watch.getSelectedOptionList().contains(0)) {
                          int length = watch.getSelectedOptionList().length;
                          int totalPoint = 0;
                          late int? element;

                          for (int i = 0; i < length; i++) {
                            element = int.parse(watch
                                    .getSelectedOptionList()
                                    .elementAt(i)
                                    .toString()) -
                                1;
                            totalPoint += element;
                          }

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Total Points'),
                                  content: Text(totalPoint.toString()),
                                  actions: [
                                  ElevatedButton(
                                  onPressed: () {},
                                  child: Text('CANCEL'),
                                ),
                                ElevatedButton(
                                onPressed: () {},
                                child: Text('ACCEPT'),
                                ),
                                ],
                                );
                              });
                          debugPrint(totalPoint.toString());
                        }
                      },
                      child: const Text('Apply')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
