import 'package:alrawda_store/controller/add_items_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:alrawda_store/my_color.dart';
import 'package:path/path.dart';

class AddNewItem extends StatefulWidget {
  AddNewItem(
      {Key? key,
      required this.typeName,
      required this.price,
      required this.price1,
      required this.price2,
      required this.imageURL

      })
      : super(key: key);

  String? typeName;
  String? price;
  String? price1;
  String? price2;
  String? imageURL;

  @override
  State<AddNewItem> createState() => _AddNewItemState();
}

class _AddNewItemState extends State<AddNewItem> {
  final messageController = TextEditingController();

  final priceController = TextEditingController();

  final price1Controller = TextEditingController();

  final price2Controller = TextEditingController();

  final _fireStore = FirebaseFirestore.instance;

  File? image;
  final imagePicker = ImagePicker();



  takePhoto() async {
    var camPhoto = await imagePicker.pickImage(source: ImageSource.camera);

      if (camPhoto != null) {
        setState(() {
          image = File(camPhoto.path);
        });
        var nameImage = basename(camPhoto.path);

        var refStorage = FirebaseStorage.instance.ref("$nameImage");


        var myfer =   refStorage.putFile(image!);

        await myfer.whenComplete(() async {
          var url = await refStorage.getDownloadURL();


            widget.imageURL = url;
        });

      }

  }

  choosePhoto() async {
    var galleryPhoto = await imagePicker.pickImage(source: ImageSource.gallery);

      if (galleryPhoto != null) {
        setState(() {
          image = File(galleryPhoto.path);
        });

        var nameImage = basename(galleryPhoto.path);

        var refStorage = FirebaseStorage.instance.ref("$nameImage");

       var myfer =   refStorage.putFile(image!);

        await myfer.whenComplete(() async {
          var url = await refStorage.getDownloadURL();

          widget.imageURL = url;
        });


      }

  }
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    validator: (String? value) {
                      if (value != null ) {
                        return "يجب تسجيل اسم الصنف";
                      }
                      return null;
                    },
                    controller: messageController,
                    onChanged: (value) {
                      widget.typeName =  value;
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
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value != null ) {
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value != null ) {
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
                            if (value != null ) {
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
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: takePhoto,
                      child: Icon(
                        Icons.camera_enhance,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: choosePhoto,
                      child: Icon(
                        Icons.filter,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Expanded(
                 child: image == null ? SizedBox() : Image.file(image!),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(

                      onPressed: () async {

                        if (formKey.currentState!.validate() && image != null && widget.imageURL != null ) {
                          messageController.clear();
                          priceController.clear();
                          price1Controller.clear();
                          price2Controller.clear();
                          _fireStore.collection("product").add({
                            "text": widget.typeName,
                            "sender": signedInUser.email,
                            "time": FieldValue.serverTimestamp(),
                            "price": widget.price,
                            "price1": widget.price1,
                            "price2": widget.price2,
                            "image" :  widget.imageURL
                          });

                          Navigator.of(context).pop();
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
          ),
        ),
      ),
    );
  }
}
