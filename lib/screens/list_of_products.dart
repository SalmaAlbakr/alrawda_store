import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/screens/add_new_item.dart';
import 'package:alrawda_store/screens/start_screen.dart';
import 'package:alrawda_store/widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListOfProducts extends StatefulWidget {
  const ListOfProducts({Key? key}) : super(key: key);

  @override
  State<ListOfProducts> createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  final searchController = TextEditingController();

  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String? typeName;
  String? price;
  String? price1;
  String? price2;
  String? imageURL;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: signedInUser.email! == "salma@email.com"
            ? FloatingActionButton(
                backgroundColor: MyColors.mainColor,
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddNewItem(
                        typeName: typeName,
                        price: price,
                        price1: price1,
                        price2: price2,
                        imageURL: imageURL,
                      ),
                    ),
                  );
                })
            : null,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Text(
                "الروضه ",
                style: TextStyle(
                  color: MyColors.mainColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(width: 25),
              Expanded(
                child: TextFormField(
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
              ),
              IconButton(
                onPressed: () async {
                  await _auth.signOut();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => StartScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.menu,
                  color: MyColors.mainColor,
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: _fireStore
                    .collection("product")
                    .orderBy("time")
                    .snapshots(),
                builder: (context, snapshot) {
                  List<MessageW> messageWidgets = [];
                  if (!snapshot.hasData) {
                    return Center(
                      child: Icon(
                        Icons.ac_unit_sharp,
                      ),
                    );
                  }
                  final theMessages = snapshot.data!.docs.reversed;
                  for (var message in theMessages) {
                    final mText = message.get("text");
                    final mSender = message.get("sender");
                    final mPrice = message.get("price");
                    final mPrice1 = message.get("price1");
                    final mPrice2 = message.get("price2");
                    final mURL = message.get("image");

                    final currentUser = signedInUser.email;
                    final singleMessage = MessageW(
                      mText: mText,
                      mSender: mSender,
                      isMe: currentUser == mSender,
                      mPrice: mPrice,
                      mPrice1: mPrice1,
                      mPrice2: mPrice2,
                      imageURL: mURL,
                    );
                    messageWidgets.add(singleMessage);
                  }
                  List<MessageW> filterNames = messageWidgets
                      .where(
                        (element) =>
                            element.mText.contains(searchController.text),
                      )
                      .toList();
                  return Expanded(
                    child: ListView(
                        children: searchController.text == ""
                            ? messageWidgets
                            : filterNames),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
