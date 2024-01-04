import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/view/about_screen.dart';
import 'package:alrawda_store/view/add_new_item.dart';
import 'package:alrawda_store/view/companies_screen.dart';
import 'package:alrawda_store/view/start_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:alrawda_store/widgets/category_contaner.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List Categories = [];
  List sliderImage = [];
  getCategories() async {
    CollectionReference dataOfProduct =
        FirebaseFirestore.instance.collection("Categories");
    QuerySnapshot snapOfData = await dataOfProduct.get();

    List<QueryDocumentSnapshot> list = snapOfData.docs;

    list.forEach((element) {
      setState(() {
        Categories.add(element.data());
      });
    });
  }
  ImageSlider() async {
    CollectionReference dataOfProduct =
        FirebaseFirestore.instance.collection("slidableImage");
    QuerySnapshot snapOfData = await dataOfProduct.get();
    List<QueryDocumentSnapshot> list = snapOfData.docs;
    list.forEach((element) {
      setState(() {
        sliderImage.add(element.data());
      });
    });

  }

  @override
  void initState() {
    getCategories();
    getCurrentUser();
    ImageSlider();
    super.initState();
  }

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        endDrawer: home_drawer(auth: _auth),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.deepOrange),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue[900],
          elevation: 0.2,
          title: Row(
            children: [
              Text(
                "أهلا بكم في الروضه:-  ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  items: sliderImage.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(i["1"]),

                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(color: Colors.black ,
                                  blurRadius: 5
                                  , blurStyle: BlurStyle.outer
                              )
                            ],
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(),
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          //child: Image.network(i["1"]),
                        );
                      },
                    );
                  }).toList(),
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: Categories.length,
                    itemBuilder: (context, int i) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CompaniesScreen(
                                CatName: Categories[i]["name"],
                              ),
                            ),
                          );
                        },
                        child: NewWidget(
                          image: Categories[i]["image"],
                          name: Categories[i]["name"],
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
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

class home_drawer extends StatelessWidget {
  const home_drawer({
    super.key,
    required FirebaseAuth auth,
  }) : _auth = auth;

  final FirebaseAuth _auth;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.deepOrangeAccent,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyColors.mainColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "شركة الروضه",
                  style: GoogleFonts.alexandria(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
          signedInUser.isAnonymous
              ? SizedBox()
              : signedInUser.email! == "elrawda123@gmail.com"
                  ? TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AddNewItem(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "اضافة صنف جديد",
                            style: TextStyle(color: MyColors.mainColor),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AboutScreen(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.contact_phone_rounded),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "للتواصل معنا",
                  style: TextStyle(
                    color: MyColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () async {
              await _auth.signOut();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StartScreen(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.login_outlined),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "تسجيل الخروج",
                  style: TextStyle(
                    color: MyColors.mainColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
