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
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(),
          ),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Image.network(imageURL),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      mText,
                      maxLines: 10,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    notValid == "0"
                        ? Text(
                            mPrice,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          )
                        : Text(
                            "المنتج غير متاح",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                    signedInUser.email! == "salma@email.com"
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                mPrice1,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                mPrice2,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                            ],
                          )
                        : Text(
                            "سعر خاص للجمله",
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
