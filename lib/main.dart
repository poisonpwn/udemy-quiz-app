import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './question.dart';
import './answer_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  static const questions = [
    {
      'question': 'Where is Gamora?',
      'answers': [
        'ask her urself.',
        'why u wanna know?',
        'who cares?',
      ]
    },
    {
      'question': 'U like Donuts?',
      'answers': [
        'OMG I Love Them!',
        'they\'re the bane of my fucking existence',
        'yeah, I like them',
        'meh',
      ]
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
    });
    print('Answer Chosen');
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Text('Some_Title'),
        ),
        body: _questionIndex < questions.length
            ? Column(children: [
                Question(questions[_questionIndex]['question']),
                ...(questions[_questionIndex]['answers'] as List<String>)
                    .map((answerText) {
                  return AnswerButton(answerText, _answerQuestion);
                }).toList()
              ])
            : Center(
                child: Text(
                  'You did it!',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.pink[300],
                  ),
                ),
              ),
      ),
    );
  }
}
