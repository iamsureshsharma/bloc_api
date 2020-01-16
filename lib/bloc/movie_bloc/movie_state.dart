import 'package:bloc_api/data/models/movie_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MovieState extends Equatable {
  bool get MovieIntialState => null;
}

class MovieIntialState extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoadingState extends MovieState {
  @override
  List<Object> get props => [];
}

class MovieLoadedState extends MovieState {
  @override
  List<MovieData> movies;
  MovieLoadedState({@required this.movies});

  @override
  List<Object> get props => null;
}

class MovieErrorState extends MovieState {

  String errorMessage;
  MovieErrorState({@required this.errorMessage});
  @override
  List<Object> get props => null;
}
