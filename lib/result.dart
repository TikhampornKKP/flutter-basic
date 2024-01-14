import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetQuiz;
  const Result(this.resultScore, this.resetQuiz, {super.key});

  String get resultPhrase {
    String resultText = '';
    if (resultScore <= 45) {
      resultText = "Low Score";
    } else if (resultScore <= 80) {
      resultText = "Medium";
    } else {
      resultText = "High!!!!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        ElevatedButton(onPressed: resetQuiz, child: const Text("Reset"))
      ],
    );
  }
}
