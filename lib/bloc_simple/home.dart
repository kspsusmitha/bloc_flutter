import 'package:bloc_examples/bloc_simple/text_bloc.dart';
import 'package:bloc_examples/bloc_simple/text_event.dart';
import 'package:bloc_examples/bloc_simple/text_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  Home({super.key});
  TextEditingController datacontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: datacontroller,
              decoration: InputDecoration(
                labelText: "Enter Text",
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TextBloc>(
                  context,
                ).add(UpdateText(datacontroller.text));
              },
              child: Text("Change"),
            ),

            BlocBuilder<TextBloc, TextState>(
              builder: (context, state) {
                return Text(state.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
