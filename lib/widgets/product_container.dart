import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/view/oneProduct_screen.dart';
import 'package:flutter/material.dart';

class MessageW extends StatelessWidget {
  const MessageW({
    Key? key,
    required this.mText,
    required this.mPrice,
    required this.mSender,
    required this.isMe,
    required this.mPrice1,
    required this.mPrice2,
    required this.Valid,
    required this.imageURL,
    required this.buyPrice,
    required this.company,
    required this.category,
  }) : super(key: key);

  final mText;
  final mPrice;
  final mPrice1;
  final mPrice2;
  final imageURL;
  final mSender;
  final bool isMe;
  final bool Valid;
  final buyPrice;
  final company;
  final category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        focusColor: Colors.blueGrey,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OneProductPage(
                productName: mText,
                onePiecePrice: mPrice,
                price1: mPrice1,
                price2: mPrice2,
                image: imageURL,
                buyPrice: buyPrice,
                Valid: Valid, company: company, category: category,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black ,
                  blurRadius: 5
                  , blurStyle: BlurStyle.outer
              )
            ],
             color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(),
          ),
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(15),
          //   border: Border.all(),
          // ),
          child: ListTile(
            leading: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Container(
                height: 70,
                width: 70,
                child: Image.network(imageURL),
              ),
            ),
            title: Text(
              mText,
              maxLines: 10,
              style: TextStyle(
                // fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            subtitle: Column(
              children: [
                Valid == true
                    ? Text(
                        mPrice,
                        style: TextStyle(
                          // fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      )
                    : Text(
                        "المنتج غير متاح",
                        style: TextStyle(
                            color: Colors.red[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      ),
                signedInUser.email == "elrawda123@gmail.com"
                    ? Column(
                        children: [
                          Text(
                            buyPrice,
                            style: TextStyle(
                              // fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            mPrice1,
                            style: TextStyle(
                              // fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            mPrice2,
                            style: TextStyle(
                              // fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      )
                    : Text("سعر خاص للجمله"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
