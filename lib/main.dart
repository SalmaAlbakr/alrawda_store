import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/screens/list_of_products.dart';
import 'package:alrawda_store/screens/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(MyColors.mainColor),
          ),
        ),
      ),
      home: _auth.currentUser != null ? ListOfProducts() : StartScreen(),
    );
  }
}
