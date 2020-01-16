import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {}

class FetchMovieEvent extends MovieEvent {
  @override
  List<Object> get props => null;
}
