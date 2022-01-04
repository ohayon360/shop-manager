import 'package:flash_chat/screens/search_screen.dart';
import 'package:flash_chat/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:flash_chat/screens/all_screen.dart';
import 'package:flash_chat/screens/add_customer.dart';
import 'package:flash_chat/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../user.dart';

UserClass currentUserHome; //current user
DateTime timestampNow = DateTime.now(); // The time the user was created
AuthService auth = new AuthService();

class HomePage extends StatefulWidget {
  static String id = 'home_screen';
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  PageController pageController; //we use it to control our page selection
  int pageIndex = 0;
  // current page index we are in

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return Scaffold(
      resizeToAvoidBottomInset: false,


      backgroundColor:  Color(0xff09031D),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    confirmSignOut(context);
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              18.0,
            ),
            child: Text(
              "שולחן עבודה",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 160,
                    height: 160,
                    child: Card(
                   //   color: Color.fromARGB(255, 21, 21, 21),
                      color: Colors.white30,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, All.id);
                                },
                                child: Image.asset(
                                  "images/rating.png",
                                  width: 64.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  EdgeAlert.show(
                                    context,
                                    title: 'לקוחות',
                                    description: 'ראה את רשימת הלקוחות שלך',
                                    gravity: EdgeAlert.TOP,
                                  );
                                },
                                child: Text(
                                  "הלקוחות שלי",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 160,
                    height: 160,
                    child: Card(
                      color: Colors.white30,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, Search.id);
                                },
                                child: Image.asset(
                                  "images/calculator.png",
                                  width: 64.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  EdgeAlert.show(
                                    context,
                                    title: 'מחשבון',
                                    description: 'חשב נתונים',
                                    gravity: EdgeAlert.TOP,
                                  );
                                },
                                child: Text(
                                  "חשב",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: SizedBox(
                    width: 160,
                    height: 160,
                    child: Card(
                      color: Colors.white30,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, AddCustomer.id);
                                },
                                child: Image.asset(
                                  "images/add-user.png",
                                  width: 64.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  EdgeAlert.show(
                                    context,
                                    title: 'הוספת לקוח',
                                    description: 'הוסף לקוח למערכת',
                                    gravity: EdgeAlert.TOP,
                                  );
                                },
                                child: Text(
                                  "הוסף לקוח ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> confirmSignOut(BuildContext context) async {
    try {
      final didRequestSignOut = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('התנתק'),
          content: Text('האם אתה בטוח שאתה רוצה להתנתק מהמערכת?'),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('בטל'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('אשר'),
            ),
          ],
        ),
      );
      if (didRequestSignOut == true) {
        _signOut(context);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
    Navigator.popUntil(context, ModalRoute.withName("/"));
  }

}
