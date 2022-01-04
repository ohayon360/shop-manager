import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flash_chat/services/auth_service.dart';
import 'package:flash_chat/screens/home_screen.dart';

final mangerRef = FirebaseFirestore.instance.collection('mangers');
final storageRef = FirebaseStorage.instance.ref();
final customersRef = FirebaseFirestore.instance.collection('customers');
final productsRef = FirebaseFirestore.instance.collection('Products');


//----------------------------------------------------------------------

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    final auth = Provider.of<AuthService>(context, listen: false);

    await auth.signInWithGoogle();

    //Navigator.pushNamed(context, HomePage.id);

  } catch (e) {
    print(e.toString());
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
    Navigator.popUntil(context, ModalRoute.withName("/"));
  }

  Future<void> confirmSignOut(BuildContext context) async {
    try {
      final didRequestSignOut = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('התנתק'),
          content: Text('האם אתה בטוח שאתה רוצה להתנתק מהמערכת?'),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('בטל'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('אשר'),
            ),
          ],
        ),
      );
      if (didRequestSignOut == true) {
        _signOut(context);
      }
    } catch (e) {
      print(e.toString());
    }
  }






}
