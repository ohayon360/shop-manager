import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/screens/input_page.dart';
import 'package:flash_chat/screens/results_screen.dart';
import 'package:flash_chat/services/navigator_to_pages.dart';
import 'package:flash_chat/widgets/reusable_card.dart';
import 'package:flash_chat/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flash_chat/calculator_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'calc_ design.dart';

class ProductTicket extends StatefulWidget {
  // We are getting the user id, and the following list from the profile page.
  final String name;
  final String pId;
  final String price;
  final Timestamp timestamp;
  final String customerName;
   String temp;

   ProductTicket(
      {this.name, this.pId, this.price, this.timestamp, this.customerName,this.temp});

  @override
  _ProductTicketState createState() => _ProductTicketState();
}

class _ProductTicketState extends State<ProductTicket> {
  double count = 0.0;


  //todo: create var for all the results together
  //todo: create method to add to the total
  //todo: create var of calc brain
  //todo: create res temp in the ui

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
    final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
    int num = 0;
    double price = double.parse(widget.price);

    CalculatorBrain calc = CalculatorBrain(
      customerName: widget.customerName,
      productName: widget.name,
        quantity:count,
        productPrice:price,
    );
    widget.temp=calc.calculateAll();



    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Text(
            widget.customerName,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 5,
          ),


          SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(

                  colour: kActiveCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                'שם מוצר',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                widget.name,
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'סהכ לפריט זה',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                calc.calculateAll(),
                                style: kNumberTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'מחיר ליחידה',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                widget.price,
                                style: kNumberTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'כמות',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        count.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  count -= 0.5;
                                  if (count < 0) {
                                    count = 0;

                                  }
                                });
                              }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                count += 0.5;
                                //res+=count*price;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
