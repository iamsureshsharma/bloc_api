import 'package:bloc/bloc.dart';
import 'package:bloc_api/bloc/movie_bloc/movie_event.dart';
import 'package:bloc_api/bloc/movie_bloc/movie_state.dart';
import 'package:bloc_api/data/models/movie_data_model.dart';
import 'package:bloc_api/data/repositories/movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieRepository movieRepository;
  MovieBloc({@required this.movieRepository});
  @override
  MovieState get initialState => MovieIntialState();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is FetchMovieEvent) {
      yield MovieLoadingState();
       try{
         List<MovieData> movieData = await movieRepository.getMoiveData();
       yield MovieLoadedState(movies: movieData); 
       }
       catch(e){
         yield MovieErrorState(errorMessage: e.toString());
       }
    }
  }
}
