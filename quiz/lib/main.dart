import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your fav colour?',
      'answers': [
        {'text': 'Red', 'score': 100},
        {'text': 'Black', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'White', 'score': 30}
      ],
    },
    {
      'questionText': 'What\'s your fav animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 20},
        {'text': 'Snake', 'score': 30},
        {'text': 'Lion', 'score': 90},
        {'text': 'Cow', 'score': 1000}
      ],
    },
    {
      'questionText': 'What\'s your fav instructor?',
      'answers': [
        {'text': 'Phillip', 'score': 100},
        {'text': 'Girish', 'score': 100},
        {'text': 'Hitesh', 'score': 100},
        {'text': 'Max', 'score': 100}
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
      _questionIndex += 1;
    });
    if (_questionIndex < _questions.length) {
      print('You have more Questions');
    } else {
      print('No more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

void main(List<String> args) {
  runApp(MyApp());
}
