import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsTickets{

  final String name;
  final String pId;
  final String price;
  final Timestamp timestamp;
  final String customerName;

   const ProductsTickets({this.name, this.pId, this.price, this.timestamp,this.customerName});

  factory ProductsTickets.fromDocument(DocumentSnapshot doc){
    return ProductsTickets(
      pId: doc.id,
      name: doc['name'],
      customerName: doc['customerName'],
      price: doc['price'],

    );
  }

}