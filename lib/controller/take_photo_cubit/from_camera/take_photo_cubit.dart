import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'dart:io';

import 'package:path/path.dart';
part 'take_photo_state.dart';

class TakePhotoByCameraCubit extends Cubit<TakePhotoByCameraState> {
  TakePhotoByCameraCubit() : super(TakePhotoInitial());

  File? image;
  final imagePicker = ImagePicker();
  String? imageUrl;

  void takePhoto() async {
    var camPhoto = await imagePicker.pickImage(source: ImageSource.camera);

    image = File(camPhoto!.path);

    emit(ChoosePhoto(image: image));

    var nameImage = basename(camPhoto.path);

    var refStorage = FirebaseStorage.instance.ref("$nameImage");

    var myfer = refStorage.putFile(image!);

    await myfer.whenComplete(() async {
      var url = await refStorage.getDownloadURL();
      imageUrl = url;
    });

    emit(ImageURLDone(URL: imageUrl));
  }

  void choosePhoto() async {
    var galleryPhoto = await imagePicker.pickImage(source: ImageSource.gallery);

    image = File(galleryPhoto!.path);

    emit(ChoosePhoto(image: image));

    var nameImage = basename(galleryPhoto.path);

    var refStorage = FirebaseStorage.instance.ref("$nameImage");

    var myfer = refStorage.putFile(image!);

    await myfer.whenComplete(() async {
      var url = await refStorage.getDownloadURL();
      imageUrl = url;
    });
    emit(ImageURLDone(URL: imageUrl));
  }

  void reset() => emit(TakePhotoInitial());
}
