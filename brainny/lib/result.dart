import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback restartQuiz;
  final int totalScore;
  final int totalQuestion;

  const Result(
      {required this.restartQuiz,
      required this.totalScore,
      required this.totalQuestion,
      Key? key})
      : super(key: key);

      String get resultdetail{
        String resultText;
        if (totalScore >= 80) {
        resultText = 'That was awesome';
        } else if (totalScore >= 40) {
          resultText = 'There\'s always room for improvement';
        } else {
          resultText = 'That wasn\'t bad but it wasn\'t good either';
        }
        return resultText;
      }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:
          const Text('Congratulations, you made it to the end of the quiz'), // To display the title it is optional
      content: Text('$resultdetail\n\n$totalScore / ${totalQuestion * 10}'),

      actions: [
        ElevatedButton(
          onPressed: restartQuiz,
          child: const Text('Restart Quiz'),
        ),
      ],
    );
  }
}
