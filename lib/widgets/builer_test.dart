import 'package:alrawda_store/category_type.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
   Test({Key? key}) : super(key: key);

 // List<String> MyList = ["list1","list2","list3","list4","list5","list6","list7","list8","list9","list10",];
  List MyList1 = [[Categories.lawhat , "الصووووره"],["list2" , "text2"],["list3" , "text3"],["list4" , "text4"],["list1" , "text"],["list2" , "text2"],["list3" , "text3"],["list4" , "text4"],["list1" , "text"],["list2" , "text2"],["list3" , "text3"],["list4" , "text4"],["list1" , "text"],["list2" , "text2"],["list3" , "text3"],["list4" , "text4"],["list1" , "text"],["list2" , "text2"],["list3" , "text3"],["list4" , "text4"],["list1" , "text"],["list2" , "text2"],["list3" , "text3"],["list4" , "text4"],];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: MyList1.length,
          itemBuilder: (context , int i) {
        return NewWidget(MyList1: MyList1 , i : i);
      }),
    );
  }
}

class NewWidget extends StatelessWidget {
   NewWidget({
    Key? key,
    required this.MyList1,
    required this.i,
  }) : super(key: key);

  final List MyList1;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(MyList1[i][0]),
          Text(MyList1[i][1]),
        ],
      ),
    );
  }
}
