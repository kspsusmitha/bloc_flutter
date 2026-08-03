import 'package:bloc_examples/cubit2/NameCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cubit Example")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Enter Name"),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                context.read<NameCubit>().changeName(controller.text);
              },
              child: const Text("Submit"),
            ),

            const SizedBox(height: 20),

            BlocBuilder<NameCubit, String>(
              builder: (context, state) {
                return Text(
                  "Name: $state",
                  style: const TextStyle(fontSize: 22),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
