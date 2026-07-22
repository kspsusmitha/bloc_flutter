import 'package:bloc_examples/bloc_example/bloc.dart';
import 'package:bloc_examples/bloc_example/events.dart';
import 'package:bloc_examples/bloc_example/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterStates>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.counter.toString()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(Increment());
                    },
                    child: Text("+"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context).add(Decrement());
                    },
                    child: Text("-"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
