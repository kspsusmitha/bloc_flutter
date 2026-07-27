import 'package:bloc_examples/bloc_get/model.dart';
import 'package:bloc_examples/bloc_get/photo_event.dart';
import 'package:bloc_examples/bloc_get/photo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  PhotoBloc() : super(PhotoInitial()) {
    on<GetPhotos>((event, emit) async {
      emit(PhotoLoading());
      try {
        final response = await Dio().get(
          "https://jsonplaceholder.typicode.com/photos",
        );
        List<PhotoModel> photo = (response.data as List)
            .map((e) => PhotoModel.fromJson(e))
            .toList();

        emit(PhotoLoaded(photos: photo));
      } catch (e) {
        emit(PhotoError(errorMessage: e.toString()));
      }
    });
  }
}
