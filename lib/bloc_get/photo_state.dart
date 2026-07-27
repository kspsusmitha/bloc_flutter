import 'package:bloc_examples/bloc_get/model.dart';

class PhotoState {}

class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<PhotoModel> photos;
  PhotoLoaded({required this.photos});
}

class PhotoError extends PhotoState {
  final String errorMessage;
  PhotoError({required this.errorMessage});
}
