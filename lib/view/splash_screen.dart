import 'dart:async';
import 'package:alrawda_store/view/home_screen.dart';
import 'package:alrawda_store/view/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return _auth.currentUser != null ? HomeScreen() : StartScreen();
            },
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0E092C),
      body: SafeArea(
        child: Center(
          child: Image.asset(
            "image/logo.PNG",
          ),
        ),
      ),
    );
  }
}
