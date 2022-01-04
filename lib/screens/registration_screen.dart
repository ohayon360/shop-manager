import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

//import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flash_chat/services/database.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';


final GoogleSignIn googleSignIn = GoogleSignIn(); //google variable

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen'; //static var id
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin{
  final _auth = FirebaseAuth.instance; //fire base _auth object
  bool showSpinner = false; // don't show the spinner affect
  String email; //the email address of the user
  String password; //the password
  AnimationController controller;
  Animation animation;



  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xff09031D),
     body: Padding(
       padding: EdgeInsets.symmetric(horizontal: 24.0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[


      Row(
             children: <Widget>[
               Hero(
                 tag: 'logo',
                 child: Container(
                   child: Image.asset("images/logo.png"),
                   height: 60.0,
                 ),
               ),
               Row(
                 mainAxisSize: MainAxisSize.min,
                 children: <Widget>[
                   const SizedBox(width: 20.0, height: 100.0),
                   const Text(
                     'shop',
                     style: TextStyle(
                       fontSize: 80.0,
                       fontFamily: 'Road Rage',
                       fontWeight: FontWeight.bold,
                       color: Colors.white,
                       letterSpacing: 6,
                     ),
                   ),
                   const SizedBox(width: 20.0, height: 100.0),
                   DefaultTextStyle(
                     style: const TextStyle(
                       fontSize: 40.0,
                       //  fontFamily: 'Horizon',
                       fontFamily: 'Road Rage',
                       color: Colors.white,
                     ),
                     child:
                     AnimatedTextKit(repeatForever: true, animatedTexts: [
                       RotateAnimatedText('manager'),
                     ]),
                   ),
                 ],
               ),
             ],
           ),
           SizedBox(
             height: 48.0,
           ),
           Padding(
             padding: EdgeInsets.symmetric(vertical: 16.0),
             child: Material(
               color: Colors.blueAccent,
               borderRadius: BorderRadius.circular(30.0),
               elevation: 5.0,
               child: MaterialButton(
                 onPressed: () {
                   signInWithGoogle(context);

                 },
                 minWidth: 200.0,
                 height: 42.0,
                 child: Text(
                   'התחבר או צור משתמש',
                   style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 20,
                   ),
                 ),
               ),
             ),
           ),
         ],
       ),
     ),
    );
  }
}
