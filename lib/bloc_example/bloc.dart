import 'package:bloc_examples/bloc_example/events.dart';
import 'package:bloc_examples/bloc_example/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  CounterBloc() : super(InitialState()) {
    on<Increment>((event, emit) {
      emit(CounterStates(counter: state.counter + 1));
    });
    on<Decrement>((event, emit) {
      emit(CounterStates(counter: state.counter - 1));
    });
  }
}
