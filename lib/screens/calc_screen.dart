import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';



class CalcScreen extends StatefulWidget {
  static String id = 'calc_screen';

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("מחשבון"),
      ),

    );
  }

}






