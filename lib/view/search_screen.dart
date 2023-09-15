import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/model/get_product_model/get_product_model.dart';
import 'package:alrawda_store/model/get_product_model/get_product_repo.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/widgets/no_internet.dart';
import 'package:alrawda_store/widgets/product_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
   SearchScreen({Key? key ,   required this.categoryName,
     required this.companyName,}) : super(key: key);
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
    getCurrentUser();

    final subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
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
    CollectionReference dataOfProduct = FirebaseFirestore.instance.collection("Categories").doc(widget.categoryName).collection("الشركات").doc(widget.companyName).collection("الاصناف");
    QuerySnapshot snapOfData = await dataOfProduct.get();

    List<QueryDocumentSnapshot> list = snapOfData.docs;

    list.forEach((element) {
      setState(() {
        Product.add(element.data());
      });

    }) ;

  }

  @override
  Widget build(BuildContext context) {
    if (internet == false) {
      return NoInternetScreen();
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: MyColors.mainColor,
                    ),
                  ),
                  hintText: "بحث",
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
                  child: FutureBuilder(
                      future: getProduct(),
                      builder:
                          (context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          final List products = snapshot.data!;

                          List filterNames = products
                              .where(
                                (element) =>
                                    element["text"].contains(searchController.text),
                              )
                              .toList();
                          return searchController.text == ""
                              ? SizedBox(
                          )
                              : ListView.builder(
                                  itemCount: filterNames.length,
                                  itemBuilder: (context, int i) {
                                    final  filteredProduct =
                                        filterNames[i];
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
                                  });
                        } else {
                          return Center(child: CircularProgressIndicator());
                            //Text("ادخل اسم الصنف الذي تريد البحث عنه");
                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
