import 'package:alrawda_store/controller/url_functions.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/widgets/no_internet.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool internet = true;
  @override
  void initState() {
    super.initState();
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          internet = false;
        });
      } else {
        setState(() {
          internet = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (internet == false) {
      return NoInternetScreen();
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("أهلا بيك في الروضه"),
          backgroundColor: MyColors.mainColor,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset("image/logo.PNG"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                  Text(
                    "شركة الروضه للادوات الكهربائيه و جميع أنواع الكبلات و المفاتيح الاوتوماتيك و اللوحات و خراطيم البلاستيك  تواصل معتا عبر الأتي : ",
                    style: GoogleFonts.alexandria(
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        AboutFunction().facebookURL();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.facebook_rounded),
                          SizedBox(width: 7),
                          Text("شركة الروضه للأدوات الكهربيه"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        AboutFunction().locationFunction();
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                          ),
                          SizedBox(width: 7),
                          Text("شارع مصر اسيوط البطيء - البدرشين - الجيزه"),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            AboutFunction().whatsUrl("01002095050");
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                child: Image.asset("image/whats.PNG"),
                              ),
                              SizedBox(width: 7),
                              Text("01002095050"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            AboutFunction().whatsUrl("01157891602");
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                child: Image.asset("image/whats.PNG"),
                              ),
                              SizedBox(width: 7),
                              Text("01157891602"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            AboutFunction().PhoneUrl("01110955595");
                          },
                          child: Row(
                            children: [
                              Icon(Icons.phone),
                              SizedBox(width: 7),
                              Text("01110955595"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            AboutFunction().PhoneUrl("01142323655");
                          },
                          child: Row(
                            children: [
                              Icon(Icons.phone),
                              SizedBox(width: 7),
                              Text("01142323655"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
