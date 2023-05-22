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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(""),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "الروضه",
                      style: GoogleFonts.alexandria(
                          decoration: TextDecoration.underline,
                          color: Colors.blue[800],
                          fontSize: 50),
                    ),
                  ],
                ),
                Text(
                  "شركة الروضه للادوات الكهربائيه و جميع أنواع الكبلات و المفاتيح الاوتوماتيك و اللوحات و خراطيم البلاستيك  تواصل معتا عبر الاتي : ",
                  style: GoogleFonts.alexandria(
                      // color: Colors.blue[800],
                      fontSize: 18),
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
                      locationUrl();
                    },
                    child: Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        SizedBox(width: 7),
                        Text(" عنوان شركة الروضه (البدرشين-الجيزه)"),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 350,
                  child: ElevatedButton(
                      onPressed: () {
                        whatsUrl();
                      },
                      child: Row(
                        children: [
                          // add phone row and do locarion button
                          Icon(Icons.whatsapp),
                          SizedBox(width: 7),
                          Text(" 01157891602 /01110955595"),
                        ],
                      )),
                ),
                Container(
                  color: MyColors.mainColor,
                  height: 50,
                  width: 350,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 7),
                      Text(
                        "01142323655 / 01004740444",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
