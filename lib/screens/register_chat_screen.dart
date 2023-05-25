import 'package:alrawda_store/controller/auth_user.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/screens/list_of_products.dart';
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
  GlobalKey<FormState> formKey = GlobalKey();
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
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "شركة الروضه",
                        style: GoogleFonts.alexandria(
                            color: Colors.blue[800], fontSize: 40),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            validator: (String? value) {
                              if (value == null || value.contains("@ / .com")) {
                                return " من فضلك أدخل الحساب و يجب ان يحتوي علي @ / com. ";
                              }
                              return null;
                            },
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
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  validator: (String? value) {
                                    if (value == null ||
                                        value.contains("0123456789") ||
                                        value.length < 6) {
                                      return "  كلمة المرور يجب ان تحتوي علي رقم ولا تقل عن 6 حروف ";
                                    }
                                    return null;
                                  },
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
                                        Icons.visibility_off_outlined,
                                        color: Colors.blue,
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
                                        color: Colors.blue,
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
                            final isExistingUser = await checkUserExists(email);

                            if (isExistingUser) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.blueAccent,
                                  content: Text("الحساب موجود بالفعل"),
                                ),
                              );
                            } else {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  _saving = true;
                                });
                                try {
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => ListOfProducts(),
                                    ),
                                  );
                                  setState(() {
                                    _saving = false;
                                  });
                                } catch (e) {
                                  print("the problem $e");
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text("يجب ملء البيانات"),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            "إنشاء حساب جديد",
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ),
                          );
                        },
                        child: Text("لديك حساب بالفعل"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
