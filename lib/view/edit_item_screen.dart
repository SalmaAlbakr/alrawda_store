import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:alrawda_store/controller/take_photo_cubit/from_camera/take_photo_cubit.dart';
import 'package:alrawda_store/view/companies_screen.dart';
import 'package:alrawda_store/view/list_of_products.dart';
import 'package:alrawda_store/view/oneProduct_screen.dart';
import 'package:alrawda_store/widgets/no_internet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
    Key? key,
  }) : super(key: key);

  String? typeName;
  String? price;
  String? price1;
  String? price2;
  String? imageURL;
  String? categoryType;
  String? buyPrice;
  String? companyName;
  String? initialTypeName;
  String? initialCompanyName;
  String? initialCategoryName;

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
    getCategories();

    typeNameController.text = widget.initialTypeName!;

    priceController.text = widget.price!;

    price1Controller.text = widget.price1!;

    price2Controller.text = widget.price2!;
    buyPriceController.text = widget.buyPrice!;
    context.read<TakePhotoByCameraCubit>().imageUrl = widget.imageURL;
  }

  // Add a new method to fetch existing data for editing
  // void fetchDataForEditing() async {
  //   try {
  //
  //
  //
  //     print(widget.typeName);
  //     DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
  //         .collection("Categories")
  //         .doc(widget.categoryType)
  //         .collection("الشركات")
  //         .doc(widget.companyName)
  //         .collection("الاصناف")
  //         .doc(widget.typeName) // Use the provided document ID
  //         .get();
  //
  //     if (documentSnapshot.exists) {
  //       // Populate form fields with existing data
  //       setState(() {
  //         widget.initialTypeName = documentSnapshot.get("text");
  //         widget.price = documentSnapshot.get("price");
  //         widget.price1 = documentSnapshot.get("price1");
  //         widget.price2 = documentSnapshot.get("price2");
  //         widget.buyPrice = documentSnapshot.get("buyPrice");
  //         widget.imageURL = documentSnapshot.get("image");
  //        // widget.t = documentSnapshot.get("time");
  //        // widget. = documentSnapshot.get("sender");
  //         //widget. = documentSnapshot.get("notValid");
  //         widget.initialCategoryName = documentSnapshot.get("Category");
  //         widget.initialCompanyName = documentSnapshot.get("companyName");
  //
  //         widget.categoryType = documentSnapshot.get("Category");
  //         widget.companyName = documentSnapshot.get("companyName");
  //         widget.typeName = documentSnapshot.get("text");
  //         // Populate other fields as needed
  //       });
  //     }
  //   } catch (e) {
  //     // Handle errors
  //     print("Error fetching data for editing: $e");
  //   }
  // }

  // ... (existing code)

  // Modify the SendData method to handle updating data
  // Future<void> SendData(BuildContext context) async {
  //   if (formKey.currentState!.validate() &&
  //       // ... (existing conditions)
  //       widget.categoryName != null) {
  //     setState(() {
  //       sendingData = true;
  //     });
  //
  //     try {
  //       if (widget.typeName != null) {
  //         // Update existing document
  //         await _fireStore
  //             .collection("Categories")
  //             .doc(widget.categoryName)
  //             .collection("الشركات")
  //             .doc(widget.companyName)
  //             .collection("الاصناف")
  //             .doc(widget.typeName!)
  //             .update({
  //           "text": widget.typeName,
  //           "price": widget.price,
  //           "price1": widget.price1,
  //           "price2": widget.price2,
  //           "buyPrice": widget.buyPrice,
  //          "image": context.read<TakePhotoByCameraCubit>().imageUrl,
  //          // "time": FieldValue.serverTimestamp(),
  //          // "sender": signedInUser.email,
  //           "notValid": "0",
  //           "Category": widget.categoryType,
  //           "companyName": widget.companyName,
  //           // Update other fields as needed
  //         });
  //       } else {
  //         // Add new document (similar to your existing code)
  //         // ...
  //       }
  //
  //       // Clear form fields and update UI
  //       messageController.clear();
  //       priceController.clear();
  //       price1Controller.clear();
  //       price2Controller.clear();
  //       buyPriceController.clear();
  //       setState(() {
  //         sendingData = false;
  //       });
  //
  //       // Show success message
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: Colors.green,
  //           content: Text("تم تعديل الصنف بنجاح"),
  //         ),
  //       );
  //
  //       // Reset photo data
  //       context.read<TakePhotoByCameraCubit>().reset();
  //     } catch (e) {
  //       // Handle errors
  //       print("Error updating data: $e");
  //       setState(() {
  //         sendingData = false;
  //       });
  //
  //       // Show error message
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //           backgroundColor: Colors.red,
  //           content: Text("حدث خطأ أثناء تعديل الصنف"),
  //         ),
  //       );
  //     }
  //   } else {
  //     // Show validation error message
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text("يجب تسجيل الصنف"),
  //       ),
  //     );
  //   }
  // }

  Future<void> SendData(BuildContext context) async {
    if (true) {
      setState(() {
        sendingData = true;
      });

      try {
        await _fireStore
            .collection("Categories")
            .doc(widget.initialCategoryName!)
            .collection("الشركات")
            .doc(widget.initialCompanyName!)
            .collection("الاصناف")
            .doc(widget.initialTypeName!)
            .delete();

        await _fireStore
            .collection("Categories")
            .doc(widget.categoryType!)
            .collection("الشركات")
            .doc(widget.companyName!)
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
          "notValid": "0",
          "Category": widget.categoryType,
          "companyName": widget.companyName,
          // Add other fields as needed
        });

        setState(() {
          sendingData = false;
        });

        // Show success message
     await   ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("تم اضافة الصنف بنجاح"),
          ),
        );
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => OneProductPage(
                productName: widget.typeName!,
                onePiecePrice: widget.price!,
                price1: widget.price1!,
                price2: widget.price2!,
                buyPrice: widget.buyPrice!,
                image: widget.imageURL!,
                notValid: "0",
                company: widget.companyName!,
                category: widget.categoryType!),),);
        // Reset photo data
        context.read<TakePhotoByCameraCubit>().reset();
      } catch (e) {
        // Handle errors
        print("Error updating data: $e");
        setState(() {
          sendingData = false;
        });

        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("حدث خطأ أثناء تعديل الصنف"),
          ),
        );
      }
    } else {
      // Show validation error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("يجب تسجيل الصنف"),
        ),
      );
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
            .doc(widget.initialCategoryName!)
            .collection("الشركات")
            .doc(widget.initialCompanyName!)
            .collection("الاصناف")
            .doc(widget.initialTypeName!)
            .delete();

        // Show success message
        await   ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text("تم حذف الصنف بنجاح"),
          ),
        );
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ListOfProducts( categoryName: widget.categoryType!, companyName: widget.companyName!,),),);
        // Reset photo data
        context.read<TakePhotoByCameraCubit>().reset();
      } catch (e) {
        // Handle errors
        print("Error updating data: $e");
        setState(() {
          sendingData = false;
        });

        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text("حدث خطأ أثناء تعديل الصنف"),
          ),
        );
      }
    } else {
      // Show validation error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("يجب تسجيل الصنف"),
        ),
      );
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
        floatingActionButton: SizedBox(
          height: 80,
          width: 80,
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 50,
            ),
            onPressed: () async {
              await SendData(context);
            },
          ),
        ),
        appBar: AppBar(
          backgroundColor: MyColors.mainColor,
          title: Row(
            children: [
              Text("تعديل الصنف"),
              TextButton(onPressed: (){
                DeleteData(context);

              }, child: Text("حذف الصنف"))
            ],
          ),
        ),
        body: SafeArea(
          child: Form(
            key: formKey,
            child: BlocBuilder<TakePhotoByCameraCubit, TakePhotoByCameraState>(
                builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: ModalProgressHUD(
                  inAsyncCall: sendingData,
                  child: Column(
                    children: [
                      Container(
                        child: DropdownButton<String>(
                          onTap: () {
                            setState(() {
                              widget.companyName = null;
                            });
                          },
                          //hint: Text(widget.initialCategoryName!),
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
                      Container(
                        child: DropdownButton<String>(
                          hint: Text(widget.initialCompanyName!),
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
                              context
                                  .read<TakePhotoByCameraCubit>()
                                  .takePhoto();
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
                              context.read<TakePhotoByCameraCubit>().image!,
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: Image.network(
                              context.read<TakePhotoByCameraCubit>().imageUrl!),
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  // Future<void> SendData(BuildContext context) async {
  //   if (formKey.currentState!.validate() &&
  //       context.read<TakePhotoByCameraCubit>().image != null &&
  //       context.read<TakePhotoByCameraCubit>().imageUrl != null &&
  //       widget.categoryType != null) {
  //     setState(() {
  //       sendingData = true;
  //     });
  //
  //     await _fireStore
  //         .collection("Categories")
  //         .doc(widget.categoryType)
  //         .collection("الشركات")
  //         .doc(widget.companyName)
  //         .collection("الاصناف")
  //         .doc(widget.typeName)
  //         .set({
  //       "text": widget.typeName,
  //       "price": widget.price,
  //       "price1": widget.price1,
  //       "price2": widget.price2,
  //       "buyPrice": widget.buyPrice,
  //       "image": context.read<TakePhotoByCameraCubit>().imageUrl,
  //       "time": FieldValue.serverTimestamp(),
  //       "sender": signedInUser.email,
  //       "notValid": "0",
  //       "Category": widget.categoryType,
  //       "companyName": widget.companyName,
  //     });
  //     messageController.clear();
  //     priceController.clear();
  //     price1Controller.clear();
  //     price2Controller.clear();
  //     buyPriceController.clear();
  //     CategoriesData.clear();
  //     CompaniesData.clear();
  //     setState(() {
  //       sendingData = false;
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.green,
  //         content: Text("تم اضافة الصنف بنجاح"),
  //       ),
  //     );
  //
  //     context.read<TakePhotoByCameraCubit>().reset();
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.red,
  //         content: Text("يجب تسجيل الصنف"),
  //       ),
  //     );
  //   }
  // }
}
