import 'package:flutter/cupertino.dart';

class Question {
  String questionText; //the data of the question Text
  bool questionAns; //the answer true or false

//the constructor that build a question object
  Question({String q, bool a}) {
    questionText = q;
    questionAns = a;
  }
}
