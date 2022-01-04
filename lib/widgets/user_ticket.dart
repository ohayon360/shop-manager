import 'package:flutter/material.dart';

class UserTicket extends StatelessWidget {
  final String id;
  final String displayName;


  UserTicket({
    this.displayName,

    this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Container(
          child: FlatButton(
            child: ListTile(

              title: Text(
                this.displayName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              dense: true,
            ),

          ),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}