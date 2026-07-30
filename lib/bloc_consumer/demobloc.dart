import 'package:bloc_examples/bloc_consumer/demoevent.dart';
import 'package:bloc_examples/bloc_consumer/demostate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Demobloc extends Bloc<DemoEvent, Demostate> {
  Demobloc() : super(InitialState()) {
    on<ShowContainerEvent>((event, emit) {
      emit(ShowContainerState());
    });

    on<ShowSnackBarEvent>((event, emit) {
      emit(ShowSnackBarState());
    });
  }
}
