import 'package:flutter/material.dart';

class SliderPics extends StatelessWidget {
  const SliderPics({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 600,
            width: 450,
            child: Column(
              children: [
                Image.asset("image/صورسلايد1.png"),
                SizedBox(height: 10,),
                Text(" لا تفوت الفرصه, خصم و لفتره محدوده",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ],
            ),
          ),
        ),
      ))
    );
  }
}
