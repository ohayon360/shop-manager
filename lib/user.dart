import 'package:cloud_firestore/cloud_firestore.dart';

class UserClass {
  final String id;
  final String mangerName;
  final String email;


  UserClass({
    this.id,
    this.mangerName,
    this.email,
  });

  factory UserClass.fromDocument(DocumentSnapshot doc){
    return UserClass(
      id: doc.id,
      mangerName: doc['mangerName'],
      email: doc['email'],
    );
  }
}