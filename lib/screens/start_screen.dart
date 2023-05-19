
import 'package:alrawda_store/my_color.dart';
import 'package:alrawda_store/screens/register_chat_screen.dart';
import 'package:alrawda_store/screens/sign_in_chat_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                child: Text("Sign In"),
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
                child: Text("Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
