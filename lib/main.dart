import 'package:bloc_api/bloc/movie_bloc/movie_bloc.dart';
import 'package:bloc_api/data/repositories/movie_repository.dart';
import 'package:bloc_api/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Data Fetch',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MovieBloc(
          movieRepository: MovieRepository(),
        ),
        child: HomePage(),
      ),
    );
  }
}
