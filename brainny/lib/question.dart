import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({
    Key? key,
    required this.currentQuestion,
    required this.questions,
  }) : super(key: key);

  final List<Map<String, Object>> questions;
  final int currentQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        questions[currentQuestion]['questionText'] as String,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
