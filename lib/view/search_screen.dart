import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/widgets/no_internet.dart';
import 'package:alrawda_store/widgets/product_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({
    Key? key,
    required this.categoryName,
    required this.companyName,
  }) : super(key: key);
  final String categoryName;
  final String companyName;
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();

  bool internet = true;
  @override
  void initState() {
    getProduct();
    getCurrentUser();

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
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    List filterNames = Product.where(
      (element) => element["text"].contains(searchController.text),
    ).toList();

    if (internet == false) {
      return NoInternetScreen();
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            "شركة الروضه",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: MyColors.mainColor,
                      ),
                    ),
                    hintText: "أبحث هنا",
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                  controller: searchController,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: searchController.text == ""
                        ? SizedBox()
                        : ListView.builder(
                            itemCount: filterNames.length,
                            itemBuilder: (context, int i) {
                              final currentUser = signedInUser.email;
                              return MessageW(
                                mText: filterNames[i]["text"],
                                mPrice: filterNames[i]["price"],
                                mSender: filterNames[i]["sender"],
                                isMe: currentUser == filterNames[i]["sender"],
                                mPrice1: filterNames[i]["price1"],
                                mPrice2: filterNames[i]["price2"],
                                imageURL: filterNames[i]["image"],
                                notValid: filterNames[i]["notValid"],
                                buyPrice: filterNames[i]["buyPrice"],
                              );
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
