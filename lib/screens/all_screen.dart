import 'package:flash_chat/widgets/user_ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flash_chat/services/auth_service.dart';
import 'package:flash_chat/services/database.dart';
import 'package:flash_chat/widgets/customer_ticket.dart';

import 'loading.dart';



class All extends StatefulWidget {
  static String id = 'all_screen';
  // Our own userId
  final String mangerId;
  final List<String> productsList;

  const All({this.mangerId, this.productsList }) ;



  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {

  allFilter() {
    return FutureBuilder(
      future: customersRef
          .where('products', arrayContainsAny: widget.productsList)
          .orderBy('customerName', descending: true)
          .get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return loadingCircular();
        }
        final products = snapshot.data.docs;
        List<StoryTickets> tickets = [];
        for (var story in products) {
          List<String> categories = List.from(story.data()['products']);
          StoryTickets ticket = StoryTickets(
            customerName: story.data()['customerName'],
            products: categories,
            customerId: story.data()['cid'],
            timestamp: story.data()['timeStamp'],
          );
          tickets.add(ticket);
        }
        return ListView(
          physics: BouncingScrollPhysics(),

          children: tickets,
        );
      },
    );
  }

  Future<Null> pullToRefresh() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      allFilter();
    });
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Provider<AuthService>(
      create: (context) => AuthService(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("הלקוחות שלי"),
          backgroundColor: Color(0xff09031D),
        //  elevation: 8,
        ),
        backgroundColor: Color(0xff09031D),
       body: RefreshIndicator(
          onRefresh: pullToRefresh,
          child: allFilter(),
        ),
     ),
    );
  }
}
