import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/model/get_product_model/get_product_model.dart';
import 'package:alrawda_store/model/get_product_model/get_product_repo.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/widgets/no_internet.dart';
import 'package:alrawda_store/widgets/product_container.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
                      future: ProductRepo().getAllProduct(),
                      builder:
                          (context, AsyncSnapshot<List<ProductsModel>> snapshot) {
                        if (snapshot.hasData) {
                          final List<ProductsModel> products = snapshot.data!;

                          List<ProductsModel> filterNames = products
                              .where(
                                (element) =>
                                    element.text.contains(searchController.text),
                              )
                              .toList();
                          return searchController.text == ""
                              ? ListView.builder(
                                  itemCount: products.length,
                                  itemBuilder: (context, int i) {
                                    final ProductsModel product = products[i];
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
                                    final ProductsModel filteredProduct =
                                        filterNames[i];
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
                          return CircularProgressIndicator();
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
