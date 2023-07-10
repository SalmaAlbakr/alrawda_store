import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/model/get_product_model/get_product_model.dart';
import 'package:alrawda_store/model/get_product_model/get_product_repo.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/view/about_screen.dart';
import 'package:alrawda_store/view/add_new_item.dart';
import 'package:alrawda_store/view/start_screen.dart';
import 'package:alrawda_store/widgets/no_internet.dart';
import 'package:alrawda_store/widgets/product_container.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class ListOfProducts extends StatefulWidget {
   ListOfProducts({Key? key , required this.categoryName}) : super(key: key);
 final String categoryName;
  @override
  State<ListOfProducts> createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  final searchController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  bool internet = true;
  @override
  void initState() {
    getCurrentUser();
    super.initState();
    final subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
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
    searchController.dispose();
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

        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          title: Text(widget.categoryName , style: TextStyle(color: Colors.black),)
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
              future: ProductRepo().getAllProduct(),
              builder: (context, AsyncSnapshot<List<ProductsModel>> snapshot) {
                if (snapshot.hasData) {
                  final List<ProductsModel> products = snapshot.data!;
                  List<ProductsModel> catItem = products
                      .where(
                        (element) =>
                            element.Category.contains(widget.categoryName),
                      )
                      .toList();

                  List<ProductsModel> filterNames = products
                      .where(
                        (element) =>
                            element.text.contains(searchController.text),
                      )
                      .toList();
                  return searchController.text == ""
                      ? ListView.builder(
                          itemCount: catItem.length,
                          itemBuilder: (context, int i) {
                            final ProductsModel product = catItem[i];
                            final currentUser = signedInUser.email;
                            return MessageW(
                              mText: product.text,
                              mPrice: product.price,
                              mSender: product.sender,
                              isMe: currentUser == product.sender,
                              mPrice1: product.price1,
                              mPrice2: product.price2,
                              imageURL: product.image,
                              notValid: product.valid,
                              buyPrice: product.buyPrice,
                            );
                          })
                      : ListView.builder(
                          itemCount: filterNames.length,
                          itemBuilder: (context, int i) {
                            final ProductsModel filteredProduct = filterNames[i];
                            final currentUser = signedInUser.email;
                            return MessageW(
                              mText: filteredProduct.text,
                              mPrice: filteredProduct.price,
                              mSender: filteredProduct.sender,
                              isMe: currentUser == filteredProduct.sender,
                              mPrice1: filteredProduct.price1,
                              mPrice2: filteredProduct.price2,
                              imageURL: filteredProduct.image,
                              notValid: filteredProduct.valid,
                              buyPrice: filteredProduct.buyPrice,
                            );
                          });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }
}
