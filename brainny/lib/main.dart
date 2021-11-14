import 'package:brainny/quiz.dart';
import 'package:flutter/material.dart';

import 'result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brainny',
      theme: ThemeData(
        appBarTheme: const AppBarTheme().copyWith(
          color: Colors.blue.shade900,
        ),
        scaffoldBackgroundColor: Colors.blue.shade900,
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Brainny'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _questions = [
    {
      'questionText': 'Which actor played James Bond in 1990?',
      'answers': [
        {'text': 'Will Smith', 'score': 0},
        {'text': 'Pierce Brosnan', 'score': 10},
        {'text': 'Elijah Wood', 'score': 0},
        {'text': 'Tony Robbins', 'score': 0}
      ],
      'hint': 'Don\'t tell me you\'ve never heard of something 007 :) .',
    },
    {
      'questionText':
          'What is the real name of Oprah Winfrey, a famous American TV host?',
      'answers': [
        {'text': 'Orwin', 'score': 0},
        {'text': 'Winfery', 'score': 0},
        {'text': 'Orpah', 'score': 10},
        {'text': 'None of the above', 'score': 0}
      ],
      'hint': 'No luck on this one(lol), it looks simple',
    },
    {
      'questionText': 'What is the national sport in Japan?',
      'answers': [
        {'text': 'Wrestling', 'score': 0},
        {'text': 'Dancing', 'score': 0},
        {'text': 'Shooting Arrows', 'score': 0},
        {'text': 'Sumo Wrestling', 'score': 10}
      ],
      'hint': 'If you don\'t get that, forget about it(Lmao)',
    },
    {
      'questionText': 'Who introduced football in the world?',
      'answers': [
        {'text': 'France', 'score': 0},
        {'text': 'China', 'score': 0},
        {'text': 'England', 'score': 10},
        {'text': 'Tokyo', 'score': 10}
      ],
      'hint': 'Well, It is definetly one of them',
    },
    {
      'questionText':
          'Which ball is worth the most points in English snooker?',
      'answers': [
        {'text': 'White ball', 'score': 0},
        {'text': 'Green ball', 'score': 0},
        {'text': 'Yellow ball', 'score': 0},
        {'text': 'Black ball', 'score': 10}
      ],
      'hint': 'If it\'s not white, then it should be ...',
    },
    {
      'questionText': 'In which country were the first Olympic Games held?',
      'answers': [
        {'text': 'England', 'score': 0},
        {'text': 'Greece', 'score': 10},
        {'text': 'Paris', 'score': 0},
        {'text': 'Russia', 'score': 0}
      ],
      'hint': 'No luck on this one',
    },
    {
      'questionText': 'How many stars has the American flag got?',
      'answers': [
        {'text': 'Fifty', 'score': 10},
        {'text': 'Thirty', 'score': 0},
        {'text': 'Twenty', 'score': 0},
        {'text': 'Fourty', 'score': 0}
      ],
      'hint': 'You can check the image online right away and start counting...(lol)',
    },

    {
      'questionText': 'Who is the largest toy distributor in the world ?',
      'answers': [
        {'text': 'Tesla', 'score': 0},
        {'text': 'Toyota', 'score': 0},
        {'text': 'McDonalds', 'score': 10},
        {'text': 'Benz', 'score': 0}
      ],
      'hint': 'One kinda look odd amoung the options',
    },
  ];

  int _currentQuestion = 0;
  int _totalScore = 0;

  void _restartQuiz() {
    setState(() {
      _currentQuestion = 0;
      _totalScore = 0;
    });
  }

  void _nextQuestion(int score) {
    setState(() {
      _currentQuestion++;
      _totalScore += score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _currentQuestion < _questions.length
              ? Quiz(
                  questions: _questions,
                  currentQuestion: _currentQuestion,
                  nextQuestion: _nextQuestion,
                  hint: _questions,
                  score: _totalScore,
                )
              : Result(
                  restartQuiz: _restartQuiz,
                  totalScore: _totalScore,
                  totalQuestion: _currentQuestion)),
    );
  }
}
