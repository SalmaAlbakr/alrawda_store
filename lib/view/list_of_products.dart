import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/model/get_product_model/get_product_model.dart';
import 'package:alrawda_store/model/get_product_model/get_product_repo.dart';
import 'package:alrawda_store/widgets/no_internet.dart';
import 'package:alrawda_store/widgets/product_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListOfProducts extends StatefulWidget {
   ListOfProducts({Key? key ,
     required this.categoryName,
     required this.companyName,
   }) : super(key: key);
 final String categoryName;
 final String companyName;
  @override
  State<ListOfProducts> createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  final searchController = TextEditingController();

  final _auth = FirebaseAuth.instance;

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

  bool internet = true;
  @override
  void initState() {
    getProduct();
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

    // List filterNames = [];
    //
    // Product.forEach((element) {
    //   if (searchController.text == element["text"]){
    //     filterNames.add(element);
    //       print(filterNames);
    //   }
    //   else {
    //     print("/////////////////////////////////////////////////////////");
    //   }
    //  // searchController.text == element["text"]
    //
    //
    // });


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
          title: Row(
            children: [
              Text(widget.categoryName , style: TextStyle(color: Colors.black),),
              Expanded(
                child: TextFormField(
                  controller: searchController,
                ),
              ),
            ],
          )
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),



          child:

         // searchController.text == ""


              Product != []?
                     ListView.builder(
              itemCount: Product.length,
              itemBuilder: (context, int i) {
               // final ProductsModel product = catItem[i];
                final currentUser = signedInUser.email;
                return MessageW(
                  mText: Product[i]["text"],
                  mPrice: Product[i]["price"],
                  mSender: Product[i]["sender"],
                  isMe: currentUser == Product[i]["sender"],
                  mPrice1: Product[i]["price1"],
                  mPrice2: Product[i]["price2"],
                  imageURL: Product[i]["image"],
                  notValid: Product[i]["notValid"],
                  buyPrice: Product[i]["buyPrice"],
                );
              })
              : CircularProgressIndicator()
          // ListView.builder(
          //     itemCount: filterNames.length,
          //     itemBuilder: (context, int i) {
          //       final ProductsModel filteredProduct = filterNames[i];
          //       final currentUser = signedInUser.email;
          //       return MessageW(
          //         mText: filteredProduct.text,
          //         mPrice: filteredProduct.price,
          //         mSender: filteredProduct.sender,
          //         isMe: currentUser == filteredProduct.sender,
          //         mPrice1: filteredProduct.price1,
          //         mPrice2: filteredProduct.price2,
          //         imageURL: filteredProduct.image,
          //         notValid: filteredProduct.valid,
          //         buyPrice: filteredProduct.buyPrice,
          //       );
          //     });
          // FutureBuilder(
          //     future: ProductRepo().getAllProduct(),
          //     builder: (context, AsyncSnapshot<List<ProductsModel>> snapshot) {
          //       if (snapshot.hasData) {
          //         final List<ProductsModel> products = snapshot.data!;
          //         List<ProductsModel> catItem = products
          //             .where(
          //               (element) =>
          //                   element.Category == widget.categoryName
          //                   //contains(widget.categoryName),
          //             )
          //             .toList();
          //
          //         List<ProductsModel> filterNames = products
          //             .where(
          //               (element) =>
          //                   element.text.
          //                   contains(searchController.text),
          //             )
          //             .toList();
          //         return searchController.text == ""
          //             ? ListView.builder(
          //                 itemCount: catItem.length,
          //                 itemBuilder: (context, int i) {
          //                   final ProductsModel product = catItem[i];
          //                   final currentUser = signedInUser.email;
          //                   return MessageW(
          //                     mText: product.text,
          //                     mPrice: product.price,
          //                     mSender: product.sender,
          //                     isMe: currentUser == product.sender,
          //                     mPrice1: product.price1,
          //                     mPrice2: product.price2,
          //                     imageURL: product.image,
          //                     notValid: product.valid,
          //                     buyPrice: product.buyPrice,
          //                   );
          //                 })
          //             : ListView.builder(
          //                 itemCount: filterNames.length,
          //                 itemBuilder: (context, int i) {
          //                   final ProductsModel filteredProduct = filterNames[i];
          //                   final currentUser = signedInUser.email;
          //                   return MessageW(
          //                     mText: filteredProduct.text,
          //                     mPrice: filteredProduct.price,
          //                     mSender: filteredProduct.sender,
          //                     isMe: currentUser == filteredProduct.sender,
          //                     mPrice1: filteredProduct.price1,
          //                     mPrice2: filteredProduct.price2,
          //                     imageURL: filteredProduct.image,
          //                     notValid: filteredProduct.valid,
          //                     buyPrice: filteredProduct.buyPrice,
          //                   );
          //                 });
          //       } else {
          //         return Center(child: CircularProgressIndicator());
          //       }
          //     }),
        ),
      ),
    );
  }
}
