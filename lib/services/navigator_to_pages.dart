import 'package:flash_chat/screens/input_page.dart';
import 'package:flash_chat/screens/search_screen.dart';
import 'package:flutter/material.dart';

showInputPage(BuildContext context,
    {String name, double productPrice, String customerName}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => InputPage(
        name: name,
        price: productPrice,
        customerName: customerName,
      ),
    ),
  );
}



