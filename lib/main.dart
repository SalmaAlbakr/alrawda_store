import 'package:alrawda_store/controller/take_photo_cubit/from_camera/take_photo_by_camera_cubit.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/view/list_of_products.dart';
import 'package:alrawda_store/view/start_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      BlocProvider(
          create: (context) => TakePhotoByCameraCubit(),
          child: MyApp()));
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
