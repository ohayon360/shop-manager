import 'dart:ffi';
import 'dart:io';

import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:flash_chat/widgets/product.dart';
import 'package:flash_chat/widgets/product_show.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flash_chat/services/database.dart';
import 'package:flash_chat/user.dart';
import '../customer_show.dart';
import 'loading.dart';
import 'package:flash_chat/widgets/customer_ticket.dart';

class Search extends StatefulWidget {
  static String id = 'search_screen';

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search>
    with AutomaticKeepAliveClientMixin<Search> {
  TextEditingController searchControllerProducts = TextEditingController();
  Future<QuerySnapshot> searchResultsProducts;
  bool _folded = true;
  String temp = "";

  handleSearchProduct(String query) async {
    List docList = [];
    var y = productsRef.where('keywordsCustomer', arrayContains: query).get();
    Future<QuerySnapshot> products;
    y.then(
      (value) => value.docs.forEach((element) {
        if (element.exists) {
          dynamic doc = element.data()['displayNameSearchCustomer'];
          docList.add(doc);
          print(doc);
          products = productsRef
              .where("displayNameSearchCustomer", whereIn: docList)
              .limit(10)
              .get();
          setState(() {
            searchResultsProducts = products;
          });
        }
      }),
    );
  }

  clearSearchProducts() {
    searchControllerProducts.clear();
  }

  Widget searchBarProducts() {
    return Center(
      child: AnimatedContainer(
        duration: Duration(microseconds: 400),
        width: _folded ? 56 : 200,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: Colors.white,
          boxShadow: kElevationToShadow[6],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(left: 16),
                  child: !_folded
                      ? TextFormField(
                          onChanged: (query) {
                            handleSearchProduct(query.toLowerCase());
                            print(query);
                          },
                          decoration: InputDecoration(
                            hintText: 'חפש ',
                            hintStyle: TextStyle(
                              color: Colors.blue[300],
                            ),
                            border: InputBorder.none,
                          ),
                        )
                      : null),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_folded ? 32 : 0),
                    topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(_folded ? 32 : 0),
                    bottomRight: Radius.circular(32),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      _folded ? Icons.search : Icons.close,
                      color: Colors.blue[900],
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _folded = !_folded;
                      searchResultsProducts = null;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //building the search results

  buildSearchResultsProducts() {
    return FutureBuilder(
      future: searchResultsProducts,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return loadingCircular();
        }
        List<ProductTicket> searchResults = [];
        snapshot.data.docs.forEach((doc) {
          ProductsTickets product = ProductsTickets.fromDocument(doc);
          ProductTicket searchResult = ProductTicket(
            name: product.name,
            customerName: product.customerName,
            pId: product.pId,
            price: product.price,
          );
          searchResults.add(searchResult);
        });
        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                String res = "";
                double sum = 0;
                for (int i = 0; i < searchResults.length; i++) {
                  sum += double.parse(searchResults[i].temp);
                }
                res = sum.toStringAsFixed(1);
                temp = res;
                print(res);
              });
            },
            child: ListView(
              children: searchResults,
            ),
          ),
        );
      },
    );
  }

  // What will happen before we see the user results
  Container noContent() {
    return Container(
      child: Expanded(
        child: ListView(
          shrinkWrap: true,
          children: [],
        ),
      ),
    );
  }

  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Color(0xff09031D),
      appBar: AppBar(
        title: Text(
          "מחשבון",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xff09031D),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    ArtSweetAlert.show(
                        context: context,
                        artDialogArgs: ArtDialogArgs(
                            type: ArtSweetAlertType.info,
                            title: "חישוב סופי",
                            text: " ראשית כל חפש שם לקוח ובחר מוצרים לחישוב "
                                "בשלב השני יש לגעת באחד הפרטים והראה לך תוצאה סופית"
                        )
                    );
                  },
                  child: Text(
                    "סהכ לתשלום ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  temp,
                  style: TextStyle(color: Colors.grey, fontSize: 40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "הזן שם ושם משפחה",
                        style: TextStyle(
                          color: Color(0xff677882),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: searchBarProducts(),
                    ),
                  ],
                ),
              ],
            ),
            searchResultsProducts == null
                ? noContent()
                : buildSearchResultsProducts(),
          ],
        ),
      ),
    );
  }
}
