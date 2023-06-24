import 'package:alrawda_store/category_type.dart';
import 'package:alrawda_store/view/list_of_products.dart';
import 'package:flutter/material.dart';
import 'package:alrawda_store/widgets/cat_contaner.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  List MyList1 = [
    [Categories.lawhat, "image/img.png"],
    [Categories.panel, "image/img_1 (1).png"],
    [Categories.lamb, "image/img_2.png"],
    [Categories.isolatedWires, "image/img_3.png"],
    [Categories.sheildWires, "image/61LfVGtRccL._AC_UF350,350_QL80_.jpg"],
    [Categories.exportedCable, "image/شركة-الكابلات-الكهربائية-المصرية.jpg"],
    [Categories.spot, "image/اسبوتات.jpg"],
    [Categories.electricHose, "image/خرطوم كهربا.jpg"],
    [Categories.Zippers, "image/سوسته.jpg"],
    [Categories.PlasticBowls, "image/بواط بلاستيك.jpg"],
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
      body: SafeArea(
        child: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "-:أهلا بيكم في الروضه  ",
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.blue[900]),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: MyList1.length,
                  itemBuilder: (context, int i) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ListOfProducts(catName: MyList1[i][0],)));
                        },
                        child: NewWidget(MyList1: MyList1, i: i));
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
