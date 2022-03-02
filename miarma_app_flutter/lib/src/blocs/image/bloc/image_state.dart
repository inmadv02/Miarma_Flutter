part of 'image_bloc.dart';

abstract class ImageState extends Equatable {
  const ImageState();

  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}

class ImageSelectedSuccessState extends ImageState {
  final XFile pickedFile;

  const ImageSelectedSuccessState(this.pickedFile);

  @override
  List<Object> get props => [pickedFile];
}

class ImageSelectedErrorState extends ImageState {
  final String message;

  const ImageSelectedErrorState(this.message);

  @override
  List<Object> get props => [message];
}
