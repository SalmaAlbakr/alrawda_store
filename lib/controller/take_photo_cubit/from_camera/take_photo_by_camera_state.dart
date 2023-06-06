part of 'take_photo_by_camera_cubit.dart';

@immutable
abstract class TakePhotoByCameraState {}

class TakePhotoByCameraInitial extends TakePhotoByCameraState {}


class TakePhotoByCamera extends TakePhotoByCameraState {
  final String? URL;

  TakePhotoByCamera({required this.URL});

}
class ChosePhotoFromGallery extends TakePhotoByCameraState {
  final String? URL;

  ChosePhotoFromGallery({required this.URL});

}


