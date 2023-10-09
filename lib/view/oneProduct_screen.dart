import 'package:flutter/material.dart';

class OneProductPage extends StatefulWidget {
  OneProductPage(
      {super.key,
      required this.productName,
      required this.onePiecePrice,
      required this.price1,
      required this.price2,
      required this.buyPrice,
      required this.image,
      required this.notValid});

  final String productName;
  final String onePiecePrice;
  final String price1;
  final String price2;
  final String buyPrice;
  final String image;
  final String notValid;

  @override
  State<OneProductPage> createState() => _OneProductPageState();
}

class _OneProductPageState extends State<OneProductPage> {
  @override
  Widget build(BuildContext context) {
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  Container(
                    child: Image.network(widget.image),
                  ),
                  Text(
                    widget.onePiecePrice,
                    style: TextStyle(
                      // fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    widget.price1,
                    style: TextStyle(
                      // fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    widget.price2,
                    style: TextStyle(
                      // fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "ملحوظه: سعر جمله 1 يبدأ من ال10 لفه "
                    "' سعر جمله 2 يبدأ من  ال5 لفه",
                    style: TextStyle(fontSize: 25),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
