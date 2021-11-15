import 'package:flutter/material.dart';
import 'package:flash_chat/screens/rounded_button.dart';
import 'quizzler_screen.dart';

//with state less widget the ui will be the same in the run time
//not updating in the run time
class Game extends StatelessWidget {
  static String id = 'game_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //the background color of this screen
      body: Container(
        //container is like div in web

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  // animation
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    //the image inside the conatiner
                    child: Image(
                      image: NetworkImage(
                          "https://2v9xey2o80cl1dh164410pjg-wpengine.netdna-ssl.com/wp-content/uploads/2019/01/trivia-background.jpg"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 24.0,
              ),

              //play game button
              RoundedButton(
                title: 'התחל משחק',
                colour: Colors.lightBlueAccent, //the color of the button
                //when this button is getting pressed take the user to the game component
                onPressed: () {
                  Navigator.pushNamed(context, Quizzler.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
