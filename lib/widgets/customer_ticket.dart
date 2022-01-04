import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flash_chat/services/database.dart';

import 'package:flash_chat/services/database.dart';

class StoryTickets extends StatelessWidget {
  //final String customerId; // To know where to go
  final String customerName; // To have comment id parameter// To have the id of the owner of the story
  final List<String> products;
  final String customerId;
  final Timestamp timestamp;

   StoryTickets(
      {this.customerName,
      this.products,
      this.customerId,
      this.timestamp});

  // Let us see all of the categories in the List
  getCategories() {
    List<Text> list = [];
    for (var product in products) {
      list.add(
        new Text(product),
      );
    }
  }





  factory StoryTickets.fromDocument(DocumentSnapshot doc){
    return StoryTickets(
      customerId: doc.id,
      customerName: doc['customerName'],
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
    final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          ExpansionTileCard(
            baseColor: Colors.white,
            key: cardA,
            leading: CircleAvatar(
              //child: Text('A'),
              backgroundImage: AssetImage('images/pic.png'),
            ),
            title: Text(
              customerName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          //  subtitle: Text(lastName),
            children: <Widget>[
              Divider(
                thickness: 1.0,
                height: 1.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Column(
                    children: [

                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Colors.grey,
                            size: 22.0,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            this.timestamp.toDate().day.toString() +
                                '.' +
                                this.timestamp.toDate().month.toString() +
                                '.' +
                                this.timestamp.toDate().year.toString(),
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("המוצרים של "+ this.customerName,style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                      SizedBox(height: 12,),
                      Container(
                        child: Column(
                          children: [
                            // This code is fine, its not a bug!
                            for (var category in products)
                              Text(
                                category + '  ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17.0,
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                buttonHeight: 52.0,
                buttonMinWidth: 90.0,
                children: <Widget>[
                  TextButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      cardB.currentState?.expand();
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.edit),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Text('ערוך לקוח'),
                      ],
                    ),
                  ),
                  TextButton(
                    style: flatButtonStyle,
                    onPressed: () {
                      cardB.currentState?.collapse();
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.delete),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Text('מחק לקוח'),
                      ],
                    ),
                  ),



                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
