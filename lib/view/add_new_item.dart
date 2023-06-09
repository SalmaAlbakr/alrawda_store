import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/controller/take_photo_cubit/from_camera/take_photo_cubit.dart';
import 'package:alrawda_store/model/category_type.dart';
import 'package:alrawda_store/view/home_screen.dart';
import 'package:alrawda_store/widgets/no_internet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNewItem extends StatefulWidget {
  AddNewItem({
    Key? key,
  }) : super(key: key);

  String? typeName;
  String? price;
  String? price1;
  String? price2;
  String? imageURL;
  String? categoryType;
  String? buyPrice;

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  List<String> CategoriesList = [
    Categories.lawhat,
    Categories.panel,
    Categories.lamb,
    Categories.isolatedWires,
    Categories.sheildWires,
    Categories.exportedCable,
    Categories.spot,
    Categories.electricHose,
    Categories.Zippers,
    Categories.PlasticBowls,
    Categories.SheetMetal,
    Categories.AutomaticSwitch,
    Categories.magicBox,
    Categories.LEDHoses,
    Categories.moshtarakWithoutWires,
    Categories.moshtarakWithWires,
    Categories.trans,
    Categories.fesha,
    Categories.weldingTape,
    Categories.Dawaya,
    Categories.finishingAccessories,
    Categories.headlampInterfaces,
    Categories.magicBox,
    Categories.magicBox,
  ];

  final messageController = TextEditingController();

  final priceController = TextEditingController();

  final price1Controller = TextEditingController();

  final price2Controller = TextEditingController();
  final buyPriceController = TextEditingController();

  final _fireStore = FirebaseFirestore.instance;
  bool internet = true;
  @override
  void initState() {
    super.initState();
    final subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          internet = false;
        });
      } else {
        setState(() {
          internet = true;
        });
      }
    });
  }

  @override
  void dispose() {
    messageController.dispose();
    priceController.dispose();
    price1Controller.dispose();
    price2Controller.dispose();

    super.dispose();
  }

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (internet == false) {
      return NoInternetScreen();
    }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColors.mainColor,
          title: Text("إضافة صنف جديد"),
        ),
        body: SafeArea(
          child: Form(
            key: formKey,
            child: BlocBuilder<TakePhotoByCameraCubit, TakePhotoByCameraState>(
                builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      child: DropdownButton<String>(
                        hint: Text("ادخل نوع الصنف"),
                        underline: Container(),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        value: widget.categoryType,
                        onChanged: (String? newValue) {
                          setState(() {
                            widget.categoryType = newValue!;
                          });
                        },
                        isExpanded: true,
                        items: CategoriesList.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        validator: (String? value) {
                          if (value == "") {
                            return "يجب تسجيل اسم الصنف";
                          }
                          return null;
                        },
                        controller: messageController,
                        onChanged: (value) {
                          widget.typeName = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: MyColors.mainColor,
                            ),
                          ),
                          labelText: "أسم الصنف :",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == "") {
                                  return "يجب تسجيل سعر الشراء ";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              controller: buyPriceController,
                              onChanged: (value) {
                                widget.buyPrice = "سعر الشراء  : " + value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MyColors.mainColor,
                                  ),
                                ),
                                labelText: "سعر الشراء",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == "") {
                                  return "يجب تسجيل سعر القطاعي";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              controller: priceController,
                              onChanged: (value) {
                                widget.price = "سعر القطاعي : " + value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MyColors.mainColor,
                                  ),
                                ),
                                labelText: "سعر القطاعي",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == "") {
                                  return "يجب تسجيل سعر الجمله 1";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              controller: price1Controller,
                              onChanged: (value) {
                                widget.price1 = "سعر الجمله1  : " + value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MyColors.mainColor,
                                  ),
                                ),
                                labelText: "سعر الجمله1",
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: TextFormField(
                              validator: (String? value) {
                                if (value == "") {
                                  return "يجب تسجيل سعر الجمله 2";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              controller: price2Controller,
                              onChanged: (value) {
                                widget.price2 = "سعر الجمله2  : " + value;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: MyColors.mainColor,
                                  ),
                                ),
                                labelText: "سعر الجمله2",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.read<TakePhotoByCameraCubit>().takePhoto();
                          },
                          child: Icon(
                            Icons.camera_enhance,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<TakePhotoByCameraCubit>()
                                .choosePhoto();
                          },
                          child: Icon(
                            Icons.filter,
                          ),
                        ),
                      ],
                    ),
                    if (state is ChoosePhoto)
                      Expanded(
                        child: ModalProgressHUD(
                          inAsyncCall: true,
                          child: Image.file(state.image!),
                        ),
                      )
                    else if (state is ImageURLDone)
                      Expanded(
                        child: ModalProgressHUD(
                          inAsyncCall: false,
                          child: Image.file(
                              context.read<TakePhotoByCameraCubit>().image!),
                        ),
                      )
                    else
                      Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (formKey.currentState!.validate() &&
                                context.read<TakePhotoByCameraCubit>().image !=
                                    null &&
                                context
                                        .read<TakePhotoByCameraCubit>()
                                        .imageUrl !=
                                    null &&
                                widget.categoryType != null) {
                              messageController.clear();
                              priceController.clear();
                              price1Controller.clear();
                              price2Controller.clear();
                              _fireStore.collection("product").add({
                                "text": widget.typeName,
                                "price": widget.price,
                                "price1": widget.price1,
                                "price2": widget.price2,
                                "buyPrice": widget.buyPrice,
                                "image": context
                                    .read<TakePhotoByCameraCubit>()
                                    .imageUrl,
                                "time": FieldValue.serverTimestamp(),
                                "sender": signedInUser.email,
                                "notValid": "0",
                                "Category": widget.categoryType
                              });
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("يجب تسجيل الصنف"),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "حفظ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
