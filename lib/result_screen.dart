import 'package:flutter/material.dart';
import 'package:advance_basics/data/question.dart';
import 'package:advance_basics/summary/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.selectedAnswers,
    required this.onRestart,
  });

  final List<String> selectedAnswers;
  final Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) => data['user_answer'] == data['correct_answer']).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.outfit(
                fontSize: 28,
                color: const Color.fromARGB(224, 255, 255, 255),
                fontWeight: FontWeight.w300,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData: summaryData),
            const SizedBox(height: 40),
            OutlinedButton.icon(
              onPressed: onRestart,
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                    const BorderSide(color: Colors.white)), // Set border color
                iconColor:
                    MaterialStateProperty.all(Colors.white), // Set icon color
              ),
              label: const Text('Restart Quiz',
                  style: TextStyle(color: Colors.white)), // Set text color
              icon: const Icon(Icons.refresh),
            ),
          ],
        ),
      ),
    );
  }
}
