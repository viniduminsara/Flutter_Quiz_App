import 'package:advance_basics/question_screen.dart';
import 'package:flutter/material.dart';
import 'package:advance_basics/start_screen.dart';
import 'package:advance_basics/data/question.dart';
import 'package:advance_basics/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  ///////////////   using initState   ///////////////

  // Widget? activeScreen;

  // @override
  // void initState() {
  //   activeScreen =  StartScreen(_switchScreen);
  //   super.initState();
  // }

  // void _switchScreen() {
  //   setState(() {
  //     activeScreen = const QusetionScreen();
  //   });
  // }

  ///////////////   without using initState   ///////////////

  String activeScreen = 'start-screen';

  void _switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  final List<String> _selectedAnswers = [];

  void _addAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void onRestart() {
    setState(() {
      _selectedAnswers.clear();
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(_switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QusetionScreen(
        onSelectAnswer: _addAnswer,
      );
    } else if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        selectedAnswers: _selectedAnswers,
        onRestart: onRestart,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 232, 88, 205),
                Color.fromARGB(255, 82, 2, 174),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,   
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
