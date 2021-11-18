
import 'package:flash_chat/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:flash_chat/screens/all_screen.dart';
import 'package:flash_chat/screens/manager_screen.dart';
import 'package:flash_chat/screens/add_customer.dart';
import 'package:flash_chat/screens/calc_screen.dart';
import 'package:flash_chat/screens/search_screen.dart';

//UserClass currentUserHome; //current user
//DateTime timestampNow = DateTime.now(); // The time the user was created
//AuthService auth = new AuthService();

//static String id = 'home_screen';
class HomePage extends StatefulWidget {
  static String id = 'home_screen';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController; //we use it to control our page selection
  int pageIndex = 0; // current page index we are in

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
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
                Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 36.0,
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
                      color: Color.fromARGB(255, 21, 21, 21),
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
                              Text(
                                "2 items",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100,
                                ),
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
                      color: Color.fromARGB(255, 21, 21, 21),
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
                                onTap: (){
                                  Navigator.pushNamed(context, Manager.id);
                                },
                                child: Image.asset(
                                  "images/personal.png",
                                  width: 64.0,
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: (){
                                  EdgeAlert.show(
                                    context,
                                    title: 'מידע אישי',
                                    description: 'מסך המידע האישי',
                                    gravity: EdgeAlert.TOP,
                                  );
                                },
                                child: Text(
                                  "מידע אישי",
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
                      color: Color.fromARGB(255, 21, 21, 21),
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
                                onTap: (){
                                  Navigator.pushNamed(context, SearchScreen.id);
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
                                onTap: (){
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
                      color: Color.fromARGB(255, 21, 21, 21),
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
                                onTap: (){
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
                                onTap: (){
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
                              Text(
                                "2 items",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100,
                                ),
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
}
