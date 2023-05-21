import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/screens/register_chat_screen.dart';
import 'package:alrawda_store/screens/sign_in_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(
                height: 25,
              ),
              Text(
                "الروضه",
                style: GoogleFonts.alexandria(
                  decoration: TextDecoration.underline,
                  fontSize: 50
                ),

              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 300,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MyColors.mainColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    );
                  },
                  child: Text("تسجيل دخول",style: TextStyle(fontSize:25,fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 300,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      MyColors.mainColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ),
                    );
                  },
                  child: Text("إنشاء حساب جديد",style: TextStyle(

                      fontSize:25,fontWeight: FontWeight.bold),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
