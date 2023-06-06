import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'dart:io';

import 'package:path/path.dart';
part 'take_photo_by_camera_state.dart';

class TakePhotoByCameraCubit extends Cubit<TakePhotoByCameraState> {
  TakePhotoByCameraCubit() : super(TakePhotoByCameraInitial());



  File? image;
  final imagePicker = ImagePicker();

  String? imageUrl ;


 void takePhoto() async {


    var camPhoto = await imagePicker.pickImage(source: ImageSource.camera);
    print(" to test block  $camPhoto");

        image = File(camPhoto!.path);

      var nameImage = basename(camPhoto.path);
    print("to test block $nameImage");
      //sent to fireStore
      var refStorage = FirebaseStorage.instance.ref("$nameImage");
    print("to test block $refStorage");
      //save pic in url
      var myfer = refStorage.putFile(image!);
    print(" to test block $myfer");
      //get url to device
      await myfer.whenComplete(() async {
        var url = await refStorage.getDownloadURL();
        imageUrl = url;


      });
    print("to test block $imageUrl");
      emit(TakePhotoByCamera(URL: imageUrl ));


  }

 void choosePhoto() async {
    var galleryPhoto = await imagePicker.pickImage(source: ImageSource.gallery);

        image = File(galleryPhoto!.path);


      var nameImage = basename(galleryPhoto.path);

      var refStorage = FirebaseStorage.instance.ref("$nameImage");

      var myfer = refStorage.putFile(image!);

      await myfer.whenComplete(() async {
        var url = await refStorage.getDownloadURL();
        imageUrl = url;

      });
    emit(ChosePhotoFromGallery(URL: imageUrl));
  }


}
