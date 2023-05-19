
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/screens/list_of_products.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _saving = false;
  bool isObscure = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text("Dream Catcher",
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue[800]),),
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
                          hintText: "Enter Your E_mail",
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
                                hintText: "Enter Your Password",
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
                                    Icons.visibility_off_outlined,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObscure = true;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove_red_eye,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                    ),
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
                          await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ListOfProducts(),
                              ),
                            );
                          setState(() {
                            _saving = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text("Sign In"),
                    ),
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
