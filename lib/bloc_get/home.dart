import 'package:bloc_examples/bloc_get/photo_bloc.dart';
import 'package:bloc_examples/bloc_get/photo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoHome extends StatelessWidget {
  const PhotoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotoLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is PhotoLoaded) {
            return ListView.builder(
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                final photo = state.photos[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(photo.url.toString()),
                  ),
                  title: Text(photo.title.toString()),
                );
              },
            );
          }
          if (state is PhotoError) {
            return Center(child: Text(state.errorMessage));
          } else {
            return Center(child: Text("No Data found"));
          }
        },
      ),
    );
  }
}
