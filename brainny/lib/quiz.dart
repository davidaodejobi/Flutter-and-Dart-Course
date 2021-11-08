import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  const Quiz(
      {required this.questions,
      required this.currentQuestion,
      required this.nextQuestion,
      required this.hint,
      required this.score,
      Key? key})
      : super(key: key);

  final List<Map<String, Object>> questions;
  final int currentQuestion;
  final Function nextQuestion;
  final List<Map<String, Object>> hint;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child:  RichText(
            text: TextSpan(
              text: 'Score: ',
              style: const TextStyle(
                fontSize: 30.0,
                color: Colors.blue,
              ),
              children: [
                TextSpan(
                  text: score.toString(),
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Colors.red,
                  ),
               
                    
                    
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Column(
          
          children: [
            
            Question(questions: questions, currentQuestion: currentQuestion),
            const SizedBox(
              height: 30,
            ),
            ...(questions[currentQuestion]['answers'] as List<Map<String, Object>>)
                .map((answer) {
              return Answer(
                  nextQuestion: () => nextQuestion(answer['score']),
                  answer: answer['text'] as String);
            }).toList(),
            ElevatedButton(
                onPressed: () {
                  _showMaterialDialog(context);
                },
                child: const Text('Show Hint')),
          ],
        ),
      ],
    );
  }

  void _showMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Hint!'),
            content: Text(hint[currentQuestion]['hint'] as String),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  _dismissDialog(context);
                },
                child: const Text(
                  'Close',
                  textAlign: TextAlign.center,
                ),
              )
            ],
          );
        });
  }

  _dismissDialog(BuildContext context) {
    Navigator.pop(context);
  }

/*
  void _showCupertinoDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Cupertino Dialog'),
            content: Text('Hey! I am Coflutter!'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog(context);
                  },
                  child: Text('Close')),
              TextButton(
                onPressed: () {
                  print('HelloWorld!');
                  _dismissDialog(context);
                },
                child: Text('HelloWorld!'),
              )
            ],
          );
        });
  }
*/
}
