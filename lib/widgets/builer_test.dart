import 'package:alrawda_store/category_type.dart';
import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  // List<String> MyList = ["list1","list2","list3","list4","list5","list6","list7","list8","list9","list10",];
  List MyList1 = [
    [Categories.lawhat, "image/img.png"],
    [Categories.panel, "image/img_1.png"],
    [Categories.lamb, "image/img_2.png"],
    [Categories.isolatedWires, "image/img_3.png"],
    [Categories.sheildWires, "text"],
    [Categories.exportedCable, "text2"],
    [Categories.spot, "text3"],
    [Categories.electricHose, "text4"],
    [Categories.Zippers, "text"],
    [Categories.PlasticBowls, "text2"],
    [Categories.SheetMetal, "text3"],
    [Categories.AutomaticSwitch, "text4"],
    [Categories.magicBox, "text"],
    [Categories.LEDHoses, "text2"],
    [Categories.fesha, "text3"],
    [Categories.moshtarakWithoutWires, "text4"],
    [Categories.moshtarakWithWires, "text"],
    [Categories.trans, "text2"],
    [Categories.weldingTape, "text3"],
    [Categories.Dawaya, "text4"],
    [Categories.finishingAccessories, "text"],
    [Categories.headlampInterfaces, "text2"],
    [Categories.magicBox, "text3"],
    [Categories.magicBox, "text4"],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
          itemCount: MyList1.length,
          itemBuilder: (context, int i) {
            return NewWidget(MyList1: MyList1, i: i);
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
          Text(MyList1[i][1]),
          Text(MyList1[i][0]),
        ],
      ),
    );
  }
}
