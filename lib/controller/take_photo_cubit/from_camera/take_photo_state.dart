part of 'take_photo_cubit.dart';

@immutable
abstract class TakePhotoByCameraState {}

class TakePhotoByCameraInitial extends TakePhotoByCameraState {}
class TakePhotoByCameraStart extends TakePhotoByCameraState {
  File? image;

  TakePhotoByCameraStart({required this.image});

}


class TakePhotoByCamera extends TakePhotoByCameraState {
  final String? URL;

  TakePhotoByCamera({required this.URL});

}
class ChosePhotoFromGallery extends TakePhotoByCameraState {
  final String? URL;

  ChosePhotoFromGallery({required this.URL});

}


