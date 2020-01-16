class MovieDataList {
  List<MovieData> movieList;

  MovieDataList({this.movieList});

  MovieDataList.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movieList = new List<MovieData>();
      json['results'].forEach((index) {
        movieList.add(new MovieData.fromJson(index));
      });
    }
  }
}

class MovieData {
  double popularity;
  int id;
  String title;
  String releaseDate;
  String originalLanguage;
  String backdropPath;
  bool adult;
  String overview;

  MovieData({
    this.popularity,
    this.id,
    this.title,
    this.releaseDate,
    this.originalLanguage,
    this.backdropPath,
    this.adult,
    this.overview,
  });

  MovieData.fromJson(Map<String, dynamic> json) {
    popularity = json['popularity'];
    id = json['id'];
    title = json['title'];
    releaseDate = json['release_date'];
    originalLanguage = json['original_language'];
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
  }
}
