import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/services/database.dart';
import 'package:flash_chat/screens/loading.dart';
import '../services/auth_service.dart';

class Landing extends StatefulWidget {
  static String id = 'landing_screen';
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {

    final auth = Provider.of<AuthService>(context, listen: false);
    return StreamBuilder<User>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User user = snapshot.data;
          if (user == null) {
            return RegistrationScreen();
          }

//else go to the home screen
          return HomePage();
        }
        return loadingCircular();
      },
    );
  }
}