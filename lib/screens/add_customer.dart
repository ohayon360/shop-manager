import 'package:edge_alert/edge_alert.dart';
import 'package:flash_chat/screens/rounded_button.dart';
import 'package:flutter/material.dart';

class AddCustomer extends StatefulWidget {
  static String id = 'add customer';

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController productController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  //todo: maybe add amount controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff09031D),
      appBar: AppBar(
        title: Text(
          "הוספת לקוח",
          style: TextStyle(
          color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
           // letterSpacing: 6,
          ),
        ),
        elevation: 8,
         backgroundColor: Color(0xff09031D),
      ),
      body: ListView(
        children: [
          Column(
            children: [

              Row(
                children: [
                  FlatButton(
                    child: Text(
                      "שם לקוח",
                      style: TextStyle(color: Colors.white,fontSize: 24),
                    ),
                    onPressed: () {
                      EdgeAlert.show(
                        context,
                        title: 'שם',
                        description: 'הזן את השם ללקוח שלך',
                        gravity: EdgeAlert.TOP,
                        icon: Icons.info,
                        backgroundColor: Colors.grey,
                      );
                    },
                  ),
                ],
              ), //name of customer

              FlatButton(
                child: TextField(
                  controller: titleController,
                  textCapitalization: TextCapitalization.sentences,
                  maxLength: 25,
                  decoration: InputDecoration(
                    hintText: "הכנס שם לקוח",
                    fillColor: Colors.white,
                    filled: true,
                    helperText: 'לפחות 3 תווים',
                    helperStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ), //the title controller

              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  FlatButton(
                    child: Text(
                      "שם משפחה",
                      style: TextStyle(color: Colors.white,fontSize: 24),
                    ), //last name

                    onPressed: () {
                      EdgeAlert.show(
                        context,
                        title: ' שם משפחה',
                        description: 'הכנס שם משפחה',
                        gravity: EdgeAlert.TOP,
                        icon: Icons.info,
                        backgroundColor: Colors.grey,
                      );
                    },
                  ),
                ],
              ), //last name

              FlatButton(
                child: TextField(
                  controller: lastNameController,
                  textCapitalization: TextCapitalization.sentences,
                  maxLength: 25,
                  decoration: InputDecoration(
                    hintText: "הכנס שם משפחה",
                    fillColor: Colors.white,
                    filled: true,
                    helperText: 'לפחות 3 תווים',
                    helperStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ), //last name controller

              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  FlatButton(
                    child: Text(
                      "שם מוצר",
                      style: TextStyle(color: Colors.white,fontSize: 24),
                    ),
                    onPressed: () {
                      EdgeAlert.show(
                        context,
                        title: 'שם מוצר',
                        description: 'הזן את השם של המוצר',
                        gravity: EdgeAlert.TOP,
                        icon: Icons.info,
                        backgroundColor: Colors.grey,
                      );
                    },
                  ),
                ],
              ), //product name

              FlatButton(
                child: TextField(
                  controller: productController,
                  textCapitalization: TextCapitalization.sentences,
                  maxLength: 25,
                  decoration: InputDecoration(
                    hintText: "הכנס שם מוצר",
                    fillColor: Colors.white,
                    filled: true,
                    helperText: 'לפחות 3 תווים',
                    helperStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ), //product controller

              SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  FlatButton(
                    child: Text(
                      "מחיר",
                      style: TextStyle(color: Colors.white,fontSize: 24),
                    ),
                    onPressed: () {
                      EdgeAlert.show(
                        context,
                        title: 'מחיר',
                        description: 'הזן מחיר ליחידה',
                        gravity: EdgeAlert.TOP,
                        icon: Icons.info,
                        backgroundColor: Colors.grey,
                      );
                    },
                  ),
                ],
              ), //price

              FlatButton(
                child: TextField(
                  controller: priceController,
                  textCapitalization: TextCapitalization.sentences,
                  maxLength: 25,
                  decoration: InputDecoration(
                    hintText: "הכנס מחיר ליחידה",
                    fillColor: Colors.white,
                    filled: true,
                    helperText: 'לפחות 3 תווים',
                    helperStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              //price controller
              RoundedButton(
                title: 'הוסף',
                colour: Colors.lightBlueAccent,


              ),
            ],
          ),
        ],
      ),
    );
  }
}
