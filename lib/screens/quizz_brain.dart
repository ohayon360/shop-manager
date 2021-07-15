import 'package:flutter/cupertino.dart';

import 'question.dart'; //this class is using a question object

class Quizz {
  int _questionNum = 0; // the question index in the list
  //the questions bank list
  List<Question> _questionBank = [
    Question(q: 'ברק יכול לפגוע באותו מקום פעמיים', a: true),
    Question(q: 'היקום אינו מתרחב.', a: true),
    Question(q: 'בהשוואה לכוכבים אחרים, השמש היא בגודל בינוני', a: true),
    Question(q: 'יש קרבה גנטית בין אדם לבננה', a: true),
    Question(q: 'אי אפשר להריח כשישנים.', a: true),
    Question(q: 'לתמנון יש 3 לבבות', a: true),
    Question(q: 'המרכיב העיקרי בגואקומולי הוא אבוקדו', a: true),
    Question(q: 'מקור גבינת הפטה הוא באיטליה', a: false),
    Question(
        q: 'רטייה על העין שימשה את הפיראטים לראייה טובה יותר בלילה', a: true),
    Question(q: 'גרזי רויאל הוא סוג של בצל', a: false),
    Question(q: 'פרת ים שוחה בקבוצות, בעקבות המנהיג', a: false),
    Question(q: 'נהר האמזונס הוא הארוך בעולם', a: false),
    Question(q: 'ברזיל היא מגדלת הקפה הגדולה בעולם', a: true),
    Question(q: 'אי אפשר לראות מהחלל את החומה הגדולה של סין', a: false),
  ];
  //if the question index is smaller than the length of the list go to the next question
  void nextQuestion() {
    if (_questionNum < _questionBank.length - 1) {
      _questionNum++;
    }
  }

//like to string methode in java
  String getQuestionText() {
    return _questionBank[_questionNum].questionText;
  }

//cheek if the Answer is Correct
  bool getCorrectAnswer() {
    return _questionBank[_questionNum].questionAns;
  }

//cheek if the quiz is finished
  bool isFinished() {
    if (_questionNum >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  //reset the _questionNum index
  void reset() {
    _questionNum = 0;
  }
}
