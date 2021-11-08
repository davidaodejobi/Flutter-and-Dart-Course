import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({required this.nextQuestion, required this.answer, Key? key})
      : super(key: key);

  final VoidCallback nextQuestion;
  final String answer;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0), color: Colors.white),
          child: InkWell(
            focusColor: Colors.blue.shade900,
            onTap: nextQuestion,
            borderRadius: BorderRadius.circular(40.0),
            child: Center(
                child: Text(
              answer,
              style: const TextStyle(fontSize: 17),
            )),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
