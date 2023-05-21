
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/screens/sign_in_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;
  bool _saving = false;
  late String email;
  late String password;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: _saving,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   "image/img_1.png",
                    //   width: 200,
                    //   height: 200,
                    // ),
                    SizedBox(
                      height: 25,
                    ),
                    Text("شركة الروضه",
                      style: GoogleFonts.alexandria(
                        color: Colors.blue[800],
                          fontSize: 40
                      ),),
                      SizedBox(height: 20,),
                      //TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue[800]),),
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "اكتب اسم الحساب الجديد",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: isObscure,
                                onChanged: (value) {
                                  password = value;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: " كلمة المرور",
                                ),
                              ),
                            ),
                            isObscure
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObscure = false;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.visibility_off_outlined,color: Colors.blue,
                                    ),
                                  )
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isObscure = true;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye,color: Colors.blue,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      width: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            MyColors.mainColor,
                          ),
                        ),
                        onPressed: () async {
                          setState(() {
                            _saving = true;
                          });
                          try {
                            final newUser =
                                await _auth.createUserWithEmailAndPassword(
                                    email: email, password: password);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),
                            );
                            setState(() {
                              _saving = false;
                            });
                          } catch (e) {
                            print("$e");
                          }
                        },
                        child: Text("إنشاء حساب جديد",style: TextStyle(

                            fontSize:25,),),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
