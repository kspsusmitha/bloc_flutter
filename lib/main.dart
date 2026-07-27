import 'package:bloc_examples/bloc_example/bloc.dart';
import 'package:bloc_examples/bloc_get/home.dart';
import 'package:bloc_examples/bloc_get/photo_bloc.dart';
import 'package:bloc_examples/bloc_get/photo_event.dart';
import 'package:bloc_examples/bloc_simple/home.dart';

import 'package:bloc_examples/bloc_simple/text_bloc.dart';
import 'package:bloc_examples/cubit/counter_cubit.dart';
import 'package:bloc_examples/cubit/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(
    BlocProvider(
      create: (_) => CounterCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
     providers: [
      BlocProvider(create: (context)=>CounterBloc()),
      BlocProvider(create: (context)=>TextBloc()),
      BlocProvider(create: (context)=>PhotoBloc()..add(GetPhotos()))
     ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PhotoHome(),
      ),
    );
  }
}