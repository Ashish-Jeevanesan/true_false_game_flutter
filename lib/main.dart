import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body:SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key key}) : super(key: key);


  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List <Widget> scoreKeeper = [];

  void checkAnswer(bool userpickedanswer){
    bool answerbool = questionBank[question_number].questionAnswer;

    if (userpickedanswer == true)
    {
      setState(() {
        question_number++;
        scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
      });
    }
    else{
      setState(() {
        question_number++;
        scoreKeeper.add(Icon(Icons.close, color: Colors.red),
        );
      });
    }


  }

  // List <String> Questions = [
  //   ' CPU is the brain of computer',
  //   ' Keyboard and mouse are hands of computer',
  //   ' My creater is a loner'
  // ];
  //
  // List<bool> answers = [
  //   true,
  //   false,
  //   false,
  // ];

  // Question q1 = Question(q:'CPU is the brain of computer',a: true );

  List <Question> questionBank = [
    Question(q:'CPU is the brain of computer', a: true),
    Question(q:' Keyboard and mouse are hands of computer', a: true),
    Question(q:' My creater is a loner', a: true),

  ];

 int question_number = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text( questionBank[question_number].questionText,
              textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
              ),
            )
            ),
          ),
        ),
        Expanded(child: Padding(padding: EdgeInsets.all(25.0),
        child: TextButton(
          style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.green),
          child: Text('True',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
          onPressed:(){
            checkAnswer(true);
          },
        ),
        ),
        ),
        Expanded(child: Padding(padding: EdgeInsets.all(15.0),
          child: TextButton(
            style: TextButton.styleFrom(
                primary: Colors.red,
                backgroundColor: Colors.red),
            child: Text('False',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed:(){

              checkAnswer(false);


            },
          ),
        ),
        ),

        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
