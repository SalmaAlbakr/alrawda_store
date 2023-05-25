import 'package:alrawda_store/controller/url_functions.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
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
                    "شركة الروضه للادوات الكهربائيه و جميع أنواع الكبلات و المفاتيح الاوتوماتيك و اللوحات و خراطيم البلاستيك  تواصل معتا عبر الاتي : ",
                    style: GoogleFonts.alexandria(
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        facebookURL();
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
                        locationUrl("29°50'40.1\"", "31°16'36.8\"");
                      },
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined),
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
                            whatsUrl("01002095050");
                          },
                          child: Row(
                            children: [
                              Icon(Icons.whatsapp),
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
                            whatsUrl("01157891602");
                          },
                          child: Row(
                            children: [
                              Icon(Icons.whatsapp),
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
                            PhoneUrl("01110955595");
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
                            PhoneUrl("01142323655");
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
