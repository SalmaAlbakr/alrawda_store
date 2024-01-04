import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/view/search_screen.dart';
import 'package:alrawda_store/widgets/no_internet.dart';
import 'package:alrawda_store/widgets/product_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ListOfProducts extends StatefulWidget {
  ListOfProducts({
    Key? key,
    required this.categoryName,
    required this.companyName,
  }) : super(key: key);
  final String categoryName;
  final String companyName;
  @override
  State<ListOfProducts> createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  List Product = [];

  getProduct() async {
    CollectionReference dataOfProduct = FirebaseFirestore.instance
        .collection("Categories")
        .doc(widget.categoryName)
        .collection("الشركات")
        .doc(widget.companyName)
        .collection("الاصناف");
    QuerySnapshot snapOfData = await dataOfProduct.get();

    List<QueryDocumentSnapshot> list = snapOfData.docs;

    list.forEach((element) {
      setState(() {
        Product.add(element.data());
      });
    });
  }

  bool internet = true;
  @override
  void initState() {
    getProduct();
    getCurrentUser();
    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          internet = false;
        });
      } else {
        setState(() {
          internet = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (internet == false) {
      return NoInternetScreen();
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Text(
                widget.categoryName,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Container(

                width: 35,
                height: 35,
                color: Colors.deepOrange,
                child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(
                          categoryName: widget.categoryName,
                          companyName: widget.companyName,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.search,
                  ),
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Product != []
              ? ListView.builder(
                  itemCount: Product.length,
                  itemBuilder: (context, int i) {
                    final currentUser = signedInUser.email;
                    return MessageW(
                      mText: Product[i]["text"],
                      mPrice: Product[i]["price"],
                      mSender: Product[i]["sender"],
                      isMe: currentUser == Product[i]["sender"],
                      mPrice1: Product[i]["price1"],
                      mPrice2: Product[i]["price2"],
                      imageURL: Product[i]["image"],
                      Valid: Product[i]["Valid"],
                      buyPrice: Product[i]["buyPrice"],
                      company: Product[i]["companyName"],
                      category: Product[i]["Category"],

                    );
                  })
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
