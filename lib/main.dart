import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import './quiz.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      "questionText": "What's your favorite color ?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Pink", "score": 5},
        {"text": "Blue", "score": 20},
        {"text": "Green", "score": 30},
      ],
    },
    {
      "questionText": "What's your favorite animal ?",
      "answers": [
        {"text": "Cat", "score": 100},
        {"text": "Dog", "score": 50},
        {"text": "Rabbit", "score": 70},
        {"text": "Rat", "score": 30},
      ],
    },
    {
      "questionText": "Who is your idol ?",
      "answers": [
        {"text": "AAA", "score": 10},
        {"text": "BBB", "score": 50},
        {"text": "CCC", "score": 20},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("This is the app"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
