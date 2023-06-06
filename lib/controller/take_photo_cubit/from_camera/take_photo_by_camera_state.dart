part of 'take_photo_by_camera_cubit.dart';

@immutable
abstract class TakePhotoByCameraState {}

class TakePhotoByCameraInitial extends TakePhotoByCameraState {}
class ChoosePhoto extends TakePhotoByCameraState {
  final File? image;

  ChoosePhoto({required this.image});

}


class ImageURLDone extends TakePhotoByCameraState {
  final String? URL;

  ImageURLDone({required this.URL});

}


