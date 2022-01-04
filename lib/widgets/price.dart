import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Icon star(double size) {
  return Icon(
    FontAwesomeIcons.moneyCheck,
    color: Colors.amber,
    size: 25,
  );
}

Widget Price(dynamic price) {
  return Text(
    price.toString(),
    style: TextStyle(color: Colors.grey[500], fontSize: 16),
  );
}
