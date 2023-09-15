import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/model/category_type.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/view/about_screen.dart';
import 'package:alrawda_store/view/add_new_item.dart';
import 'package:alrawda_store/view/list_of_products.dart';
import 'package:alrawda_store/view/search_screen.dart';
import 'package:alrawda_store/view/start_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alrawda_store/widgets/category_contaner.dart';
import 'package:google_fonts/google_fonts.dart';

class CompaniesScreen extends StatefulWidget {

  String CatName;
  CompaniesScreen({Key? key , required this.CatName}) : super(key: key);

  @override
  State<CompaniesScreen> createState() => _CompaniesScreenState();
}

class _CompaniesScreenState extends State<CompaniesScreen> {
 //String? name ;
 //String? image ;
 List Companies = [];

  getCompanies() async {
    CollectionReference dataOfProduct = FirebaseFirestore.instance.collection("Categories").doc(widget.CatName).collection("الشركات");
    QuerySnapshot snapOfData = await dataOfProduct.get();

    List<QueryDocumentSnapshot> list = snapOfData.docs;
      print(list);
    list.forEach((element) {
      setState(() {
        Companies.add(element.data());
      });
    }) ;
  }

  @override
  void initState() {
    getCompanies();
    getCurrentUser();
    super.initState();
  }

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Directionality(

      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Column (
            children: [
              Text(
               widget.CatName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blue[900]),
              ),
            Text("الشركات المتاحه" , style: TextStyle(
              color: Colors.black26

            ),)
            ],
          ),
          iconTheme: IconThemeData(),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15,),
               /**//* CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  items: ["image/slide01.PNG","image/slide3.PNG","image/0000.PNG","image/Screenshot from 2023-07-25 17-40-37.png"].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.asset(i),
                        );
                      },
                    );
                  }).toList(),
                ),*/
                Expanded(
                  child: GridView.builder(
                    itemCount: Companies.length,
                    itemBuilder: (context, int i) {
                      return
                        //Container();
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ListOfProducts(
                                  companyName: Companies[i]["name"],
                                  categoryName: widget.CatName,
                                ),
                              ),
                            );
                          },
                          child: NewWidget( image: Companies[i]["image"],
                            name: Companies[i]["name"],));
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

