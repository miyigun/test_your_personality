import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_your_personality/controller/data.dart';
import 'package:test_your_personality/controller/loading_widget.dart';
import 'package:test_your_personality/controller/question_and_options.dart';
import 'package:test_your_personality/model/personality_model.dart';

final controller = ChangeNotifierProvider((ref) => PersonalityModel());

class TestScreen extends ConsumerStatefulWidget {
  const TestScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => TestScreenState();
}

class TestScreenState extends ConsumerState<TestScreen> {
  @override
  void initState() {
    ref.read(controller).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: LoadingWidget(
          isLoading: watch.isLoadingData,
          child: Padding(
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
                          if (watch.getSelectedOptionList().contains(0)==false) {
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

                            debugPrint('Buradayım');

                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Total Points'),
                                    content: const Text(''),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('CANCEL'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: const Text('ACCEPT'),
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
      ),
    );
  }
}
