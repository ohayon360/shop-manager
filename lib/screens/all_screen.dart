import 'package:flutter/material.dart';
import 'package:flash_chat/screens/rounded_button.dart';
import 'quizzler_screen.dart';

//with state less widget the ui will be the same in the run time
//not updating in the run time
class All extends StatelessWidget {
  static String id = 'all_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("ALL"),
      ),
    );
  }
}