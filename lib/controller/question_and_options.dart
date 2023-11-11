import 'package:flutter/material.dart';
import 'package:test_your_personality/controller/data.dart';

class QuestionAndOptionsWidget extends StatefulWidget {
  const QuestionAndOptionsWidget({super.key, required this.index});

  final int index;

  @override
  State<QuestionAndOptionsWidget> createState() =>
      _QuestionAndOptionsWidgetState();
}

class _QuestionAndOptionsWidgetState extends State<QuestionAndOptionsWidget> {
  @override
  Widget build(BuildContext context) {
    int? selectedOption;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.8,
          child: Text('${widget.index+1}- ${questions[widget.index]}'),
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
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          radioIndex = value!;
                        });
                      },
                    ),
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
