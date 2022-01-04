import 'package:flutter/material.dart';

class UserTicket extends StatelessWidget {
  final String customerName; // To have comment id parameter
  final String lastName;
  final String customerId;

  const UserTicket({this.customerName, this.lastName, this.customerId});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  this.customerName ,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onTap: (){

              },
            ),
          ],
        ),
      ],
    );
  }
}
