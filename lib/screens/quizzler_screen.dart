import 'package:flutter/material.dart';

import 'package:cool_alert/cool_alert.dart';

import 'quizz_brain.dart';

Quizz q1 = Quizz();

class Quizzler extends StatelessWidget {
  static String id = "quizzler_screen"; //static var id

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900, //the background Color
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(), //the class that we se down
          ),
        ),
      ),
    );
  }
}

//----here-----------------------
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper =
      []; //list of symbols to show the user if he put the correct Answer

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = Quizz().getCorrectAnswer(); //true or false

    setState(() {
      if (q1.isFinished() == true) {
        //if the quizz has ended show the user alert
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "סיום",
        );
//start the quizz again from the start
        q1.reset();

        scoreKeeper =
            []; //empty list , the list is getting objects when the quizz is start
      } else {
        if (userPickedAnswer == correctAnswer) {
          //if the ans is true add to the scoreKeeper check icon
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          //if the ans is uncorrected had to the scoreKeeper close icon
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        //go to the next Question
        q1.nextQuestion();
      }
    });
  }

//the style of the ui
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                q1.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            //the button of the true and its style
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'נכון',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            //the button of the false
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'לא נכון',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          //the scoreKeeper symbols the we are see in the ui
          children: scoreKeeper,
        )
      ],
    );
  }
}
