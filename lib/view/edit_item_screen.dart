import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/controller/take_photo_cubit/from_camera/take_photo_cubit.dart';
import 'package:alrawda_store/view/list_of_products.dart';
import 'package:alrawda_store/view/oneProduct_screen.dart';
import 'package:alrawda_store/widgets/no_internet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alrawda_store/my_color.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditItemScreen extends StatefulWidget {
  EditItemScreen({
    required this.initialCompanyName,
    required this.initialCategoryName,
    required this.initialTypeName,
    required this.typeName,
    required this.price,
    required this.price1,
    required this.price2,
    required this.imageURL,
    required this.categoryType,
    required this.buyPrice,
    required this.companyName,
    required this.Valid,
    Key? key,
  }) : super(key: key);

  String typeName;
  String price;
  String price1;
  String price2;
  String imageURL;
  String categoryType;
  String buyPrice;
  String? companyName;
  String initialTypeName;
  String initialCompanyName;
  String initialCategoryName;
  bool Valid;

  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  final typeNameController = TextEditingController();

  final priceController = TextEditingController();

  final price1Controller = TextEditingController();

  final price2Controller = TextEditingController();
  final buyPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCategories();
    getCompanies();
    typeNameController.text = widget.initialTypeName;

    priceController.text = widget.price;

    price1Controller.text = widget.price1;

    price2Controller.text = widget.price2;
    buyPriceController.text = widget.buyPrice;
    context.read<TakePhotoByCameraCubit>().imageUrl = widget.imageURL;
  }

  Future<void> SendData(BuildContext context) async {
    if (true) {
      setState(() {
        sendingData = true;
      });

      try {
        await _fireStore
            .collection("Categories")
            .doc(widget.initialCategoryName)
            .collection("الشركات")
            .doc(widget.initialCompanyName)
            .collection("الاصناف")
            .doc(widget.initialTypeName)
            .delete();

        await _fireStore
            .collection("Categories")
            .doc(widget.categoryType)
            .collection("الشركات")
            .doc(widget.companyName)
            .collection("الاصناف")
            .doc(widget.typeName)
            .set({
          "text": widget.typeName,
          "price": widget.price,
          "price1": widget.price1,
          "price2": widget.price2,
          "buyPrice": widget.buyPrice,
          "image": context.read<TakePhotoByCameraCubit>().imageUrl,
          "time": FieldValue.serverTimestamp(),
          "sender": signedInUser.email,
          "Valid": widget.Valid,
          "Category": widget.categoryType,
          "companyName": widget.companyName,
        });

        setState(() {
          sendingData = false;
        });

        await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("تم تعديل الصنف بنجاح"),
          ),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => OneProductPage(
              productName: widget.typeName,
              onePiecePrice: widget.price,
              price1: widget.price1,
              price2: widget.price2,
              buyPrice: widget.buyPrice,
              image: widget.imageURL,
              Valid: widget.Valid,
              company: widget.companyName!,
              category: widget.categoryType,
            ),
          ),
        );

        context.read<TakePhotoByCameraCubit>().reset();
      } catch (e) {
        print("Error updating data: $e");
        setState(() {
          sendingData = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("حدث خطأ أثناء تعديل الصنف"),
          ),
        );
      }
    }
  }

  Future<void> DeleteData(BuildContext context) async {
    if (true) {
      setState(() {
        sendingData = true;
      });

      try {
        await _fireStore
            .collection("Categories")
            .doc(widget.initialCategoryName)
            .collection("الشركات")
            .doc(widget.initialCompanyName)
            .collection("الاصناف")
            .doc(widget.initialTypeName)
            .delete();

        await ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("تم حذف الصنف بنجاح"),
          ),
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ListOfProducts(
              categoryName: widget.categoryType,
              companyName: widget.companyName!,
            ),
          ),
        );

        context.read<TakePhotoByCameraCubit>().reset();
      } catch (e) {
        print("Error updating data: $e");
        setState(() {
          sendingData = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("حدث خطأ أثناء تعديل الصنف"),
          ),
        );
      }
    }
  }

  int iC = 0;
  List CompaniesData = [];
  List<String> CompaniesName = [];

  getCompanies() async {
    CollectionReference dataOfProduct = FirebaseFirestore.instance
        .collection("Categories")
        .doc(widget.categoryType)
        .collection("الشركات");
    QuerySnapshot snapOfData = await dataOfProduct.get();

    List<QueryDocumentSnapshot> list = snapOfData.docs;
    list.forEach((element) {
      setState(() {
        CompaniesData.add(element.data());
        CompaniesName.add(CompaniesData[iC]["name"]);
        iC++;
      });
    });
  }

  int im = 0;
  List CategoriesData = [];
  List<String> CategoriesName = [];

  getCategories() async {
    CollectionReference dataOfProduct =
        FirebaseFirestore.instance.collection("Categories");
    QuerySnapshot snapOfData = await dataOfProduct.get();

    List<QueryDocumentSnapshot> list = snapOfData.docs;
    list.forEach((element) {
      setState(() {
        CategoriesData.add(element.data());
        CategoriesName.add(CategoriesData[im]["name"]);
        im++;
      });
    });
  }

  final _fireStore = FirebaseFirestore.instance;
  bool sendingData = false;
  bool internet = true;

  @override
  @override
  void dispose() {
    typeNameController.dispose();
    priceController.dispose();
    price1Controller.dispose();
    price2Controller.dispose();
    buyPriceController.dispose();

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
        // floatingActionButton: SizedBox(
        //   height: 80,
        //   width: 80,
        //   child: FloatingActionButton(
        //     child: Icon(
        //       Icons.add,
        //       size: 50,
        //     ),
        //     onPressed: () async {
        //       await SendData(context);
        //     },
        //   ),
        // ),
        // appBar: AppBar(
        //   toolbarHeight: 80, // Adjust the height as needed
        //   backgroundColor: MyColors.mainColor,
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         "تعديل الصنف",
        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       ),
        //       Row(
        //         children: [
        //           TextButton(
        //                     onPressed: () {
        //
        //                       showDialog<void>(
        //                         context: context,
        //                         builder: (context) {
        //                           return AlertDialog(
        //                             actions: <Widget>[
        //                               TextButton(
        //                                 onPressed: () => Navigator.pop(context, 'Cancel'),
        //                                 child: const Text('الغاء'),
        //                               ),
        //                               TextButton(
        //                                 onPressed: () => DeleteData(context),
        //                                 child: const Text('حذف'),
        //                               ),
        //                             ],
        //                             content: Text(
        //                               "هل تريد حذف الصنف",
        //                             ),
        //                           );
        //                         },
        //                       );
        //                      // DeleteData(context);
        //                     },
        //             child: Text(
        //               "حذف الصنف",
        //               style: TextStyle(color: Colors.white),
        //             ),
        //           ),
        //           CupertinoSwitch(
        //             value: widget.Valid,
        //             onChanged: (value) {
        //               setState(() {
        //                 widget.Valid = value;
        //               });
        //             },
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),

        body: SafeArea(
          child: Form(
            key: formKey,
            child: BlocBuilder<TakePhotoByCameraCubit, TakePhotoByCameraState>(
                builder: (context, state) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'image/white-color-background-w5cnsm83mhhhex71.jpg'), // replace with your image file
                    fit: BoxFit.cover,
                  ),
                ),
                height: MediaQuery.of(context).size.height,
                child: ModalProgressHUD(
                  inAsyncCall: sendingData,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        if (state is ChoosePhoto)

                          //تحميل الصوره
                          Expanded(
                            child: ModalProgressHUD(
                              inAsyncCall: true,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      50.0), // Adjust the value as needed
                                  border: Border.all(),
                                  image: DecorationImage(
                                    image: FileImage(state.image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                //    child: Image.file(state.image!)
                              ),
                            ),
                          )
                        else if (state is ImageURLDone)
                          Expanded(
                            child: ModalProgressHUD(
                              inAsyncCall: false,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      50.0), // Adjust the value as needed
                                  border: Border.all(// Border width
                                      ),
                                  image: DecorationImage(
                                    image: FileImage(context
                                        .read<TakePhotoByCameraCubit>()
                                        .image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // child: Image.file(
                                //   context.read<TakePhotoByCameraCubit>().image!,
                                // ),
                              ),
                            ),
                          )
                        else
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    50.0),
                                border: Border.all(
                                    ),
                                image: DecorationImage(
                                  image: NetworkImage(context
                                      .read<TakePhotoByCameraCubit>()
                                      .imageUrl!),
                                ),
                              ),
                              // child: Image.network(
                              //   context.read<TakePhotoByCameraCubit>().imageUrl!,
                              // ),
                            ),
                          ),
                        // الاسم و زرار حذف الصنف و زرار موجود او لا
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text(
                              widget.Valid == true ?
                              "الصنف متاح" : "الصنف غير متاح" ,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            CupertinoSwitch(
                              value: widget.Valid,
                              onChanged: (value) {
                                setState(() {
                                  widget.Valid = value;
                                });
                              },
                            ),
                          ],
                        ),

                        // الكاتيجوري
                        Container(
                          child: DropdownButton<String>(
                            onTap: () {
                              setState(() {
                                widget.companyName = null;
                              });
                            },
                            underline: Container(),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            value: widget.categoryType,
                            onChanged: (String? newValue) {
                              setState(() {
                                CompaniesName.clear();
                                widget.categoryType = newValue!;
                                getCompanies();
                              });
                            },
                            isExpanded: true,
                            items: CategoriesName.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(
                                  child: Text(
                                    value,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        // الشركات
                        Container(
                          child: DropdownButton<String>(
                            underline: Container(),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            value: widget.companyName,
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.companyName = newValue!;
                              });
                            },
                            isExpanded: true,
                            items: CompaniesName.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Center(
                                  child: Text(
                                    value,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),

                        // اسم الصنف
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            validator: (String? value) {
                              if (value == "") {
                                return "يجب تسجيل اسم الصنف";
                              }
                              return null;
                            },
                            controller: typeNameController,
                            onChanged: (value) {
                              widget.typeName = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: MyColors.mainColor,
                                ),
                              ),
                              labelText: widget.typeName,
                            ),
                          ),
                        ),

                        // اسعار الصنف
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
                                    widget.buyPrice = value;
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
                                    widget.price = value;
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

                        // اسعار الصنف الجمله
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
                                    widget.price1 = value;
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
                                    widget.price2 = value;
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

                        // اختيار تحميل صوره من الكاميرا او المعرض
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     // صوره من الكاميرا
                        //     ElevatedButton(
                        //       onPressed: () {
                        //         context
                        //             .read<TakePhotoByCameraCubit>()
                        //             .takePhoto();
                        //       },
                        //       child: Icon(
                        //         Icons.camera_enhance,
                        //       ),
                        //     ),
                        //
                        //     // صوره من المعرض
                        //     ElevatedButton(
                        //       onPressed: () {
                        //         context
                        //             .read<TakePhotoByCameraCubit>()
                        //             .choosePhoto();
                        //       },
                        //       child: Icon(
                        //         Icons.filter,
                        //       ),
                        //     ),
                        //   ],
                        // ), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // صوره من الكاميرا
                            ElevatedButton(
                              onPressed: () {
                                showDialog<void>(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              context, 'Cancel'),
                                          child: const Text('الغاء'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              DeleteData(context),
                                          child: const Text('حذف'),
                                        ),
                                      ],
                                      content: Text(
                                        "هل تريد حذف الصنف",
                                      ),
                                    );
                                  },
                                );
                                // DeleteData(context);
                              },
                              child: Text ("حذف الصنف") ,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red)
                              ),
                            ),

                            // صوره من المعرض
                            ElevatedButton(
                              onPressed: () async {
                                await SendData(context);
                              },
                              child: Text ("تعديل الصنف") ,
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.green)
                              ),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
/// مكان زرار تحميل صوره جديده TODO: 