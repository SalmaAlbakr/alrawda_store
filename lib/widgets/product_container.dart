import 'package:alrawda_store/controller/add_items_function.dart';
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
    required this.notValid,
    required this.imageURL,
  }) : super(key: key);

  final mText;
  final mPrice;
  final mPrice1;
  final mPrice2;
  final imageURL;
  final mSender;
  final bool isMe;
  final notValid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(),
        ),
        child: ListTile(
          leading: Image.network(imageURL),
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
              notValid == "0" ?
              Text(mPrice) :
                  Text("المنتج غير متاح"),

              signedInUser.email! == "salma@email.com" ?
              Column(
                children: [
                  Text(mPrice1),
                  Text(mPrice2),
                ],
              ) : Text("سعر خاص للجمله"),
            ],
          ),
        ),
      ),
    );
  }
}
