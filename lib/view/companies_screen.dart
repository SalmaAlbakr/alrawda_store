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

  getData() async {
    CollectionReference dataOfProduct = FirebaseFirestore.instance.collection("Categories").doc(widget.CatName).collection("الشركات");
    QuerySnapshot snapOfData = await dataOfProduct.get();

    List<QueryDocumentSnapshot> list = snapOfData.docs;
print(list);
    list.forEach((element) {

    }) ;

  }

  @override
  void initState() {
    getData();
    getCurrentUser();
    super.initState();
  }
  // List MyList1 = [
  //   [Categories.lawhat, "image/img.png"],
  //   [Categories.panel, "image/img_1 (1).png"],
  //   [Categories.lamb, "image/img_2.png"],
  //   [Categories.isolatedWires, "image/img_3.png"],
  //   [Categories.sheildWires, "image/61LfVGtRccL._AC_UF350,350_QL80_.jpg"],
  //   [Categories.exportedCable, "image/شركة-الكابلات-الكهربائية-المصرية.jpg"],
  //   [Categories.spot, "image/اسبوتات.jpg"],
  //   [Categories.electricHose, "image/خرطوم كهربا.jpg"],
  //   [Categories.Zippers, "image/سوسته.jpg"],
  //   [Categories.PlasticBowls, "image/بواط بلاستيك.jpg"],
  //   [Categories.SheetMetal, "image/bwatsaag.png"],
  //   [Categories.AutomaticSwitch, "image/مفاتيح اتومانيك.jpg"],
  //   [Categories.magicBox, "image/علب ماجيك.jpg"],
  //   [Categories.LEDHoses, "image/خرطوك ليد.jpg"],
  //   [Categories.fesha, "image/دكر و نتايه.jpg"],
  //   [Categories.moshtarakWithoutWires, "image/IMG_20230705_043139.jpg"],
  //   [Categories.moshtarakWithWires, "image/Screenshot from 2023-07-04 06-13-13.png"],
  //   [Categories.trans, "image/ترنز.jpg"],
  //   [Categories.weldingTape, "image/شريط لحام.jpg"],
  //   [Categories.Dawaya, "image/IMG_20230705_044240.jpg"],
  //   [Categories.finishingAccessories, "image/Screenshot from 2023-07-04 06-15-22.png"],
  //   [Categories.headlampInterfaces, "image/Screenshot from 2023-07-04 06-11-01.png"],
  //   [Categories.upandDown, "image/IMG_20230706_001849.jpg"],
  // ];
  // static const List <String>  lawhatCompanies =[
  //   "سيجاأم",
  //   "فينوس",
  //   "الحمد",
  //   "دراجون و MN",
  //   "النور",
  //   "الجوده لايت",
  //   "المصرية"
  //
  // ];

  final _auth = FirebaseAuth.instance;

  // final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Directionality(

      textDirection: TextDirection.rtl,
      child: Scaffold(

        endDrawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: MyColors.mainColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "شركة الروضه",
                      style: GoogleFonts.alexandria(
                          color: Colors.white, fontSize: 40),
                    ),
                  ],
                ),
              ),
              signedInUser.email! == "elrawda123@gmail.com"?  TextButton(
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
                    SizedBox(width: 5,),
                    Text(
                      "اضافة صنف جديد",
                      style: TextStyle(color: MyColors.mainColor),
                    ),
                  ],
                ),
              ): SizedBox(),
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
                    SizedBox(width: 10,),
                    Text(
                      "للتواصل معنا",
                      style: TextStyle(color: MyColors.mainColor),
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
                    SizedBox(width: 5,),
                    Text(
                      "تسجيل الخروج",
                      style: TextStyle(color: MyColors.mainColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.2,
          title: Row(
            children: [
              Text(
                "الشركات المتاحه  ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.blue[900]),
              ),
              IconButton(onPressed: (){

                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen()));
              }, icon: Icon(Icons.search))
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
                    itemCount: 2,
                    itemBuilder: (context, int i) {
                      return Container();
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.of(context).push(
                        //       MaterialPageRoute(
                        //         builder: (context) => ListOfProducts(
                        //           categoryName: lawhatCompanies[i][0],
                        //         ),
                        //       ),
                        //     );
                        //   },
                        //   child: NewWidget(MyList1: MyList1, i: i));
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

