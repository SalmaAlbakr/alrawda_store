
import 'package:alrawda_store/controller/add_items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class AddNewItem extends StatefulWidget {
  AddNewItem({Key? key ,
    required this.typeName,
    required this.price,
    required this.price1,
    required this.price2})
      : super(key: key);

  String? typeName;
  String? price;
  String? price1;
  String? price2;


  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  final messageController = TextEditingController();

  final priceController = TextEditingController();

  final price1Controller = TextEditingController();

  final price2Controller = TextEditingController();

  final _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 300,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        widget.typeName = "أسم الصنف :" + value;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "أسم الصنف :",
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    messageController.clear();
                    priceController.clear();
                    price1Controller.clear();
                    price2Controller.clear();
                    _fireStore.collection("product").add({
                      "text": widget.typeName,
                      "sender": signedInUser.email,
                      "time": FieldValue.serverTimestamp(),
                      "price": widget.price,
                      "price1" : widget.price1,
                      "price2" : widget.price2,

                    });
                  },
                  child: Text(
                    "حفظ",style: TextStyle(fontWeight: FontWeight.bold,fontSize:20),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(

                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        keyboardType:TextInputType.number ,
                        controller: priceController,
                        onChanged: (value) {
                          widget.price= "سعر القطاعي : "+ value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "سعر القطاعي",
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(

                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        keyboardType:TextInputType.number ,
                        controller: price1Controller,
                        onChanged: (value) {
                          widget.price1= "سعر الجمله1  : "+ value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "سعر الجمله1",
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        keyboardType:TextInputType.number ,
                        controller: price2Controller,
                        onChanged: (value) {
                          widget.price2= "سعر الجمله2  : "+ value;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "سعر الجمله2",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}