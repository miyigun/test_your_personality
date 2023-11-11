import 'package:flutter/material.dart';
import 'package:test_your_personality/controller/data.dart';
import 'package:test_your_personality/controller/question_and_options.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            ],
          ),
        ),
      ),
    );
  }
}
