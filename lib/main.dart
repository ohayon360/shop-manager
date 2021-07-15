import 'package:flash_chat/screens/start_game.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/quizzler_screen.dart';
import 'package:firebase_core/firebase_core.dart';

//waite until the fire base will lode
//in this line all the apps in flutter are start, like the main function in java
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //don't show the debug banner in the ui

      initialRoute: WelcomeScreen.id, //the default rout is the welcome screen

      /*the routs are taking us to the required screen that
      we want in are app
      each class have static var id
      */
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        Quizzler.id: (context) => Quizzler(),
        Game.id: (context) => Game(),
      },
    );
  }
}
