import 'package:alrawda_store/view/about_screen.dart';
import 'package:flutter/material.dart';

class OneProductPage extends StatefulWidget {
  OneProductPage(
      {super.key,
      required this.productName,
      required this.onePiecePrice,
      required this.price1,
      required this.price2,
      required this.buyPrice,
      required this.image,
      required this.notValid});

  final String productName;
  final String onePiecePrice;
  final String price1;
  final String price2;
  final String buyPrice;
  final String image;
  final String notValid;

  @override
  State<OneProductPage> createState() => _OneProductPageState();
}

class _OneProductPageState extends State<OneProductPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text(
            "شركة الروضه",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff1D267D)),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: 500,
                    width: 500,
                    child: Image.network(widget.image),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffA5D7E8),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(),
                    ),
                   // color: Color(0xffA5D7E8),
                    child: Column(
                      children: [
                        Text(
                          widget.onePiecePrice,
                          style: TextStyle(
                             fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          widget.price1,
                          style: TextStyle(
                             fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          widget.price2,
                          style: TextStyle(
                             fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Wrap(
                    children: [
                      Text("ملحوظه :",style: TextStyle(fontSize: 25,color: Colors.red,fontWeight: FontWeight.bold),
                        ),
                      Text(
                        " أسعار الجمله تحدد علي حسب الكميات لمعرفة تفاصيل أكثر  "
                        ,
                        style: TextStyle(fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 20,
                      ),
                      Center(
                        child: TextButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AboutScreen()));}, child: Text(
                          "تواصل معنا  "
                          ,
                          style: TextStyle(fontSize: 25,decoration: TextDecoration.underline),
                        ),),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
