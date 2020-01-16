import 'dart:convert';
import 'package:bloc_api/bloc/movie_bloc/movie_bloc.dart';
import 'package:bloc_api/bloc/movie_bloc/movie_event.dart';
import 'package:bloc_api/bloc/movie_bloc/movie_state.dart';
import 'package:bloc_api/data/models/movie_data_model.dart';
import 'package:bloc_api/data/models/movie_detail_model.dart';
import 'package:bloc_api/screens/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
int idValue;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MovieBloc movieBloc;
  

  @override
  void initState() {
    movieBloc = BlocProvider.of<MovieBloc>(context);
    movieBloc.add(
      FetchMovieEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: Text('Moive List'),
              ),
              body: Container(
                child: BlocListener<MovieBloc, MovieState>(
                  listener: (context, state) {
                    if (state is MovieErrorState) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(state.errorMessage),
                      ));
                    }
                  },
                  child: BlocBuilder<MovieBloc, MovieState>(
                    builder: (context, state) {
                      if (state is MovieIntialState) {
                        return loading();
                      } else if (state is MovieLoadingState) {
                        return loading();
                      } else if (state is MovieLoadedState) {
                        return createList(state.movies);
                      } else if (state is MovieErrorState) {
                        return error();
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget loading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget error() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('SOME ERROR OCCURED !'),
      ),
    );
  }

  Widget createList(List<MovieData> movieList) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        idValue = movieList[index].id;
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () async {
              await getMoiveDetail(idValue);
              toDetailPage(context: context);
            },
            child: ListTile(
              contentPadding: EdgeInsets.all(
                8.0,
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  movieList[index].title,
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 17.0,
                  ),
                ),
              ),
              subtitle: Text(
                movieList[index].overview,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget toDetailPage({BuildContext context}) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            
          ),
        ));
  }

  
}
Future<List<Data>> getMoiveDetail(int id) async {
    String secondURL =
        'http://api.themoviedb.org/3/movie/$id/videos?api_key=802b2c4b88ea1183e50e6b285a27696e';
    var header = {'Content-Type': 'application/json'};
    var response = await http.get(secondURL, headers: header);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      List<Data> movieDetailList = Detail.fromJson(parsedJson).details;
      return movieDetailList;
    } else {
      throw Exception();
    }
  }
Future fetchDetail(){
  getMoiveDetail(idValue);
}
