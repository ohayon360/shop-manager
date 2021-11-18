import 'package:flutter/material.dart';



class Manager extends StatelessWidget {
  static String id = 'manager_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("manager screen"),
      ),
    );
  }
}