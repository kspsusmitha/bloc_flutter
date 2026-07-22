import 'package:bloc_examples/bloc_simple/text_event.dart';
import 'package:bloc_examples/bloc_simple/text_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextBloc extends Bloc<TextEvent, TextState> {
  TextBloc() : super(TextState("")) {
    on<UpdateText>((event, emit) {
      emit(TextState(event.text));
    });
  }
}
