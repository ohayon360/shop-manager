import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:flash_chat/services/keywords.dart';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flash_chat/screens/home_screen.dart';
import 'package:flash_chat/services/auth_service.dart';
import 'package:flash_chat/services/database.dart';
import 'package:uuid/uuid.dart';
import 'package:flash_chat/widgets/rounded_button.dart';
import 'package:flash_chat/widgets/product.dart';

class AddCustomer extends StatefulWidget {
  static String id = 'add customer';
  final String mangerId;

  AddCustomer({Key key, this.mangerId});

  @override
  _AddCustomerState createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer>
    with AutomaticKeepAliveClientMixin<AddCustomer> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  List<String> products = [];

  bool isUploading = false;

  // Getting doc id for the storyID
  String customerId = Uuid().v4();
  String productId = Uuid().v4();
  //--------------------------

  final String currentMangerId = auth.currentUser?.uid;
  final String currentcustomerId = auth.currentUser?.uid;
  //-------------------------------------------------

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    //---------------------------

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  addProductId() {
    String name=nameController.text.toString();
 products.add(name);
  }

  publishCustomer() async {

    if (titleController.text.toString() != "" &&
        products.length > 0 && titleController.text.toString().length>5) {
      Navigator.pushNamed(context, HomePage.id);
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
              type: ArtSweetAlertType.success,
              title: "הפעולה הצליחה!",
              text: " הלקוח נוסף בהצלחה למערכת ,תוכל לראות אותה ברשימת הלקוחות שלך"
          )
      );

      await mangerRef.doc(currentMangerId).update({
        'customers': FieldValue.arrayUnion([customerId]),
      });
      await customersRef.doc(customerId).set({
        'uid': currentMangerId,
        'cid': customerId,
        'products': products,
        'customerName': titleController.text.toString(),
        'timeStamp': DateTime.now(),
        "keywords": setSearchParam(titleController.text.toString()),
        "displayNameSearch": titleController.text.toString(),
        // According to the users rating
      });
    }
    else{

      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.warning,
            title: "אופס!",
            text: "יש למלא תחילה פרטי לקוח ולאחר מכן להוסף מוצרים ומחיר",
          )
      );
    }

    setState(() {
        customerId= Uuid().v4();
      // _uploadedFileURL = 'assets/images/upload_photo.png';
      isUploading = true;
      // file = null;
      titleController.clear();

    });
  }



  addProducts() async {
    if (nameController.text.toString() != "" &&
        priceController.text.toString() != "") {
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.success,
            title: "הצלחה",
            text: "המוצר נוסף בהצלחה ללקוח זה",
          )
      );
      await productsRef.doc(productId).set({
        'name': nameController.text.toString(),
        'price': priceController.text.toString(),
        'timeStamp': DateTime.now(),
        'cid': customerId,
        'pid': productId,
        'customerName': titleController.text.toString(),
        "keywords": setSearchParam(nameController.text.toString()),
        "displayNameSearch": nameController.text.toString(),
        "keywordsCustomer": setSearchParam(titleController.text.toString()),
        "displayNameSearchCustomer": setSearchParam(titleController.text.toString()),

      });
    }

    setState(() {
      //  customerId= Uuid().v4();
      // _uploadedFileURL = 'assets/images/upload_photo.png';
      isUploading = false;
      // file = null;
      nameController.clear();
      priceController.clear();
      productId = Uuid().v4();
    });
  }

  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Provider<AuthService>(
      create: (context) => AuthService(),
      child: Scaffold(
        backgroundColor: Color(0xff09031D),
        appBar: AppBar(
          title: Text(
            "הוספת לקוח",
            style: TextStyle(
              color: Colors.blueAccent,
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
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      onPressed: () {
                        EdgeAlert.show(
                          context,
                          title: 'שם',
                          description: 'נה להזין שם '
                              'שם משפחה',
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
                    maxLength: 20,
                    decoration: InputDecoration(
                        hintText: "שם ,"
                            "שם משפחה",
                      fillColor: Colors.white,
                      filled: true,
                     // helperText: 'לפחות 3 תווים',
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

                SizedBox(
                  height: 10,
                ),

                Row(
                  children: [
                    FlatButton(
                      child: Text(
                        "מחיר",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      onPressed: () {
                        EdgeAlert.show(
                          context,
                          title: 'מחיר',
                          description: 'הזן מחיר למוצר',
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
                    controller: priceController,
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      //  hintText: "הכנס שם לקוח",
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

                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    FlatButton(
                      child: Text(
                        "שם מוצר",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      onPressed: () {
                        EdgeAlert.show(
                          context,
                          title: 'שם',
                          description: 'הזן שם מוצר',
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
                    controller: nameController,
                    textCapitalization: TextCapitalization.sentences,
                    maxLength: 10,
                    decoration: InputDecoration(
                      //  hintText: "הכנס שם לקוח",
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
                RoundedButton(
                  title: 'הוסף מוצר',
                  colour: Colors.indigo,
                  onPressed: () {
                    print(currentcustomerId);
                    addProducts();
                    addProductId();
                    EdgeAlert.show(
                      context,
                      title: 'הוספה',
                      description: 'כאן ניתן להוסיף מוצרים ללקוח שבחרת',
                      gravity: EdgeAlert.TOP,
                      icon: Icons.info,
                      backgroundColor: Colors.grey,
                    );

                    //publishCustomer();
                  },
                ),
                RoundedButton(
                  title: 'הוסף לקוח',
                  colour: Colors.lightBlueAccent,
                  onPressed: () {
                    print(currentcustomerId);
                      publishCustomer();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
