import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/view/about_screen.dart';
import 'package:alrawda_store/view/edit_item_screen.dart';
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
      required this.Valid,
      required this.company,
      required this.category});

  final String productName;
  final String onePiecePrice;
  final String price1;
  final String price2;
  final String buyPrice;
  final String image;
  final bool Valid;
  final String company;
  final String category;

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "شركة الروضه",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),

              signedInUser.isAnonymous
                  ? SizedBox()
                  : signedInUser.email! == "elrawda123@gmail.com" ?
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => EditItemScreen(
                                initialCompanyName: widget.company,
                                initialCategoryName: widget.category,
                                initialTypeName: widget.productName,
                                typeName: widget.productName,
                                price: widget.onePiecePrice,
                                price1: widget.price1,
                                price2: widget.price2,
                                imageURL: widget.image,
                                categoryType: widget.category,
                                buyPrice: widget.buyPrice,
                                companyName: widget.company, Valid: widget.Valid,
                              )),
                    );
                  },
                  child: Text("تعديل الصنف")) : SizedBox()
            ],
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'image/white-color-background-w5cnsm83mhhhex71.jpg'), // replace with your image file
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Container(
                    //         decoration: BoxDecoration(
                    //           boxShadow: [
                    //             BoxShadow(color: Colors.black ,
                    //                 blurRadius: 5
                    //                 , blurStyle: BlurStyle.outer
                    //             )
                    //           ],
                    //           // color: Color(0xffA5D7E8),
                    //           borderRadius: BorderRadius.circular(15),
                    //           border: Border.all(),
                    //         ),
                    //         child: Text(
                    //           widget.productName,
                    //           style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontSize: 20,
                    //             color: Color(0xff1D267D),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //
                    //           signedInUser.isAnonymous
                    //               ? SizedBox()
                    //               : signedInUser.email! == "elrawda123@gmail.com" ?
                    //           TextButton(
                    //               onPressed: () {
                    //                 Navigator.of(context).push(
                    //                   MaterialPageRoute(
                    //                       builder: (context) => EditItemScreen(
                    //                             initialCompanyName: widget.company,
                    //                             initialCategoryName: widget.category,
                    //                             initialTypeName: widget.productName,
                    //                             typeName: widget.productName,
                    //                             price: widget.onePiecePrice,
                    //                             price1: widget.price1,
                    //                             price2: widget.price2,
                    //                             imageURL: widget.image,
                    //                             categoryType: widget.category,
                    //                             buyPrice: widget.buyPrice,
                    //                             companyName: widget.company, Valid: widget.Valid,
                    //                           )),
                    //                 );
                    //               },
                    //               child: Text("تعديل الصنف")) : SizedBox()
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Container(
                     // decoration: BoxDecoration(
                      //   boxShadow: [
                      //     BoxShadow(color: Colors.black ,
                      //         blurRadius: 5
                      //         , blurStyle: BlurStyle.outer
                      //     )
                      //   ],
                      //   // color: Color(0xffA5D7E8),
                      //   borderRadius: BorderRadius.circular(15),
                      //   border: Border.all(),
                      // ),
                      height: 500,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black ,
                              blurRadius: 5
                              , blurStyle: BlurStyle.outer
                          )
                        ],
                        borderRadius: BorderRadius.circular(
                            50.0),
                        border: Border.all(
                        ),

                        image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      //    child: Image.file(state.image!)
                    ),
                    // Container(
                    //   height: 500,
                    //   width: 500,
                    //   child: Image.network(widget.image),
                    // ),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black ,
                              blurRadius: 5
                              , blurStyle: BlurStyle.outer
                          )
                        ],
                        // color: Color(0xffA5D7E8),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.productName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff1D267D),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.black ,
                          blurRadius: 5
                              , blurStyle: BlurStyle.outer
                          )
                        ],
                       // color: Color(0xffA5D7E8),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(),
                      ),
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
                        Text(
                          "ملحوظه :",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " أسعار الجمله تحدد علي حسب الكميات لمعرفة تفاصيل أكثر  ",
                          style: TextStyle(fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AboutScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "تواصل معنا  ",
                              style: TextStyle(
                                fontSize: 25,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
