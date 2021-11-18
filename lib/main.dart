import 'package:flash_chat/screens/all_screen.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:flash_chat/screens/manager_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flash_chat/screens/add_customer.dart';
import 'package:flash_chat/screens/calc_screen.dart';
import 'package:flash_chat/screens/search_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ShopManager());
}

class ShopManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //don't show the debug banner in the ui

      initialRoute: WelcomeScreen.id, //the default rout is the welcome screen


      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
       All.id: (context) => All(),
        HomePage.id: (context) => HomePage(),
        AddCustomer.id:(context)=>AddCustomer(),
        Manager.id:(context)=>Manager(),
        CalcScreen.id:(context)=>CalcScreen(),
        SearchScreen.id:(context)=>SearchScreen(),
      },
    );
  }
}
