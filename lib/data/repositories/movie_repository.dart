import 'dart:convert';

import 'package:bloc_api/data/models/movie_data_model.dart';
import 'package:http/http.dart' as http;

abstract class MovieRepo {
  Future<List<MovieData>> getMoiveData();
}

class MovieRepository implements MovieRepo {
  @override
  Future<List<MovieData>> getMoiveData() async {
    String firstURL =
        'http://api.themoviedb.org/3/movie/popular?api_key=802b2c4b88ea1183e50e6b285a27696e';
    var header = {'Content-Type': 'application/json'};
    var response = await http.get(firstURL, headers: header);
    if (response.statusCode == 200) {
      var parsedJson = json.decode(response.body);
      List<MovieData> moviedatalist =
          MovieDataList.fromJson(parsedJson).movieList;
      return moviedatalist;
    } else {
      throw Exception();
    }
  }
}
