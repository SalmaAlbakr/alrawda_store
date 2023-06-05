import 'package:flutter/material.dart';

class MessageW extends StatelessWidget {
  const MessageW(
      {Key? key,
      required this.mText,
      required this.mPrice,
        required this.mSender,
        required this.isMe,
     required this.mPrice1,
     required this.mPrice2,
     required this.imageURL, })
      : super(key: key);

  final mText;
  final mPrice;
  final mPrice1;
  final mPrice2;
  final imageURL;
  final mSender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Row(
            children: [
              Expanded(
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
                    Text(
                      mPrice,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    Row(
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
