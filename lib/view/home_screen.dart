import 'package:alrawda_store/widgets/builer_test.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text("أهلا بيكم في الروضه :  ",style: TextStyle(fontWeight: FontWeight.bold),),
              ListView(
                children: [
                  //unique widget
                  Container(
                    child: NewWidget(MyList1:My, i: 1)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
