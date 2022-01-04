import 'package:flutter/material.dart';
import 'package:flash_chat/services/database.dart';

class AddProducts extends StatefulWidget {
  final String currentUserId;
  final String storyId;

  AddProducts({this.currentUserId, this.storyId});

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  // Controller of the textfield
  TextEditingController reportController = TextEditingController();

  // Function that will send the report to the firebase
  reportStoryToFirebase() {

  }

  @override
  void initState() {
    super.initState();
    print(widget.currentUserId);
    print(widget.storyId);
  }

  @override
  void dispose() {
    super.dispose();
    reportController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}