import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/view/list_of_products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alrawda_store/widgets/category_contaner.dart';

class OneProductPage extends StatefulWidget {
  const OneProductPage({super.key});

  @override
  State<OneProductPage> createState() => _OneProductPageState();
}

class _OneProductPageState extends State<OneProductPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("PRODUCT NAME"),
                Container(
                  child: Image.network("https://firebasestorage.googleapis.com/v0/b/alrawda-store.appspot.com/o/company%2F%D9%85%D8%B5%D8%B7%D9%81%D9%89%20%D9%85%D8%AD%D9%85%D9%88%D8%AF.jpeg?alt=media&token=999883e6-4745-4bd7-81b0-46477f81effe&_gl=1*1wwljvm*_ga*MTI5NzMyMDM4NS4xNjkwMzMwMTAw*_ga_CW55HF8NVT*MTY5NjgwNjc1OC4xNi4xLjE2OTY4MDY4NDguMzIuMC4w"),
                ),
              Row(
                children: [
                  Text(
                    "سعر القطاعي",
                    style: TextStyle(
                      // fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    "سعر جمله 1",
                    style: TextStyle(
                      // fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    "سعر جمله 2",
                    style: TextStyle(
                      // fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )

                ],

              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("ملحوظه: سعر جمله 1 يبدأ من ال10 لفه ' سعرجمله 2 يبدأ من  ال5 لفه")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
