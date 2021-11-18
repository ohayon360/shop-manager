import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:edge_alert/edge_alert.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen'; //static var id
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance; //fire base _auth object
  bool showSpinner = false; // don't show the spinner affect
  String email; //the email address of the user
  String password; //the password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, //the background Color of this page is white
      body: ModalProgressHUD(
        inAsyncCall:
            showSpinner, //when the user is pressing the sign in button he will se the loading spinner
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // put the widgets inside the column in the center
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //inside the flexible widget we have hero animation
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0, //the height of the container
                    //the image that we see in screen
                    //take this image from this url
                    child: Image.asset("images/light.png"),
                  ),
                ),
              ),
              //like br in web
              SizedBox(
                height: 48.0,
              ),
              //this is the text field that we see in the ui
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value; //take the email that the user is entered
                },
                decoration:
                    //the hint text to the user
                    kTextFieldDecoration.copyWith(hintText: 'כתובת מייל'),
              ),
              SizedBox(
                height: 8.0,
              ),
              //text field of the user password
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value; //take the password that the user is entered
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'סיסמא'),
              ),
              SizedBox(
                height: 24.0,
              ),

              RoundedButton(
                //the sign in button
                title: 'הירשם', //is text
                colour: Colors.blueAccent, //is color
                //when the button is getting pressed show the loading spinner
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  //take the data from the user of is password and its mail address
                  //if everything is fine add the user to the data base

                  //---------sign in ------------------------------------
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
//if everything is fine take the user to the start game screen
                      Navigator.pushNamed(context, HomePage.id);
                      //show to the user alert about the Registration
                      CoolAlert.show(
                        context: context,
                        type: CoolAlertType.success,
                        text: "ההרשמה בוצעה בהצלחה!",
                      );
                    }

                    setState(() {
                      showSpinner = false; //don't show the loading spinner
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
