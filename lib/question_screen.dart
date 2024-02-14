import 'package:flutter/material.dart';
import 'package:advance_basics/answer_button.dart';
import 'package:advance_basics/data/question.dart';

class QusetionScreen extends StatefulWidget {
  const QusetionScreen({super.key});

  @override
  State<QusetionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QusetionScreen> {
  final currentQuestion = questions[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center  ,
            ),
            const SizedBox(height: 40),
            ...currentQuestion.answers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onTap: () {},
              );
            }),
          ],
        ),
      ),
    );
  }
}
