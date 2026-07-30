import 'package:bloc_examples/bloc_consumer/demobloc.dart';
import 'package:bloc_examples/bloc_consumer/demoevent.dart';
import 'package:bloc_examples/bloc_consumer/demostate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Demohome extends StatelessWidget {
  const Demohome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<Demobloc,Demostate>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (state is ShowContainerState) Text("Welcome"),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<Demobloc>(context).add(ShowSnackBarEvent());
                  },
                  child: Text("showSnackbar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<Demobloc>().add(ShowContainerEvent());
                  },
                  child: Text("show message"),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is ShowSnackBarState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Snackbar shown")));
          }
        },
      ),
    );
  }
}
