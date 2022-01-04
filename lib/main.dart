import 'package:flash_chat/screens/all_screen.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:flash_chat/screens/landing.dart';
import 'package:flash_chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flash_chat/screens/add_customer.dart';
import 'package:flash_chat/screens/calc_screen.dart';
import 'package:flash_chat/screens/search_screen.dart';
import 'package:provider/provider.dart';
import 'package:flash_chat/screens/input_page.dart';


/*
todo: 1)להמשיך את עמוד המחשבון
todo: 2)לעשות ארגון קבצים וחבילות
todo: 3) לבנות את מסך התוצאה
 todo:4) לעשות בדיקות לכל האפליקציה
 todo:5)לשבצר עיצובי מסכים והתראות
 todo:6) לממש פונקציות מחיקה ועריכת נתונים
 todo ----> למחר ללכת לפרודקט שואוו ולסדר את הסטייט שנוכל להוסיף לשנות ערכים
 */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ShopManager());
}

class ShopManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AuthService>(
      create: (context) => AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, //don't show the debug banner in the ui

        initialRoute: Landing.id, //the default rout is the welcome screen


        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
         All.id: (context) => All(),
          HomePage.id: (context) => HomePage(),
          AddCustomer.id:(context)=>AddCustomer(),
          CalcScreen.id:(context)=>CalcScreen(),
          Search.id:(context)=>Search(),
          InputPage.id:(context)=>InputPage(),


        },
        home: Landing(),
      ),
    );
  }
}
