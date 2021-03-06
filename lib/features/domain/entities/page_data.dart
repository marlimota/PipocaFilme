//classe com informações da página de lista de filmes da api
import 'package:equatable/equatable.dart';

class PageData extends Equatable {
  final int page;
  final List<MovieData> results;
  final int totalPages;
  final int totalResults;

  PageData({this.page, this.results, this.totalPages, this.totalResults});

  @override
  List<Object> get props => [page, results, totalPages, totalResults];

  // //Converte de Json para objeto (ou seja de texto para código)
  // PageData.fromJson(Map<String, dynamic> json) {
  //   page = json['page'];
  //   if (json['results'] != null) {
  //     results = <FilmData>[];
  //     json['results'].forEach((v) {
  //       results.add(new FilmData.fromJson(v));
  //     });
  //   }
  //   totalPages = json['total_pages'];
  //   totalResults = json['total_results'];
  // }

  // //converte de volta para o formato json
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['page'] = this.page;
  //   if (this.results != null) {
  //     //data['results'] = this.results.map((v) => v.toJson()).toList();
  //   }
  //   data['total_pages'] = this.totalPages;
  //   data['total_results'] = this.totalResults;
  //   return data;
  // }
}

//Define os atributos do objeto filme
class MovieData extends Equatable {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final num popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final num voteAverage;
  final int voteCount;

  MovieData(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  @override
  List<Object> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount
      ];

  // FilmData.fromJson(Map<String, dynamic> json) {
  //   adult = json['adult'];
  //   backdropPath = json['backdrop_path'];
  //   genreIds = json['genre_ids'].cast<int>();
  //   id = json['id'];
  //   originalLanguage = json['original_language'];
  //   originalTitle = json['original_title'];
  //   overview = json['overview'];
  //   popularity = json['popularity'];
  //   posterPath = "https://www.themoviedb.org/t/p/w220_and_h330_face" +
  //       json['poster_path'];
  //   releaseDate = json['release_date'];
  //   title = json['title'];
  //   video = json['video'];
  //   voteAverage = json['vote_average'];
  //   voteCount = json['vote_count'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['adult'] = this.adult;
  //   data['backdrop_path'] = this.backdropPath;
  //   data['genre_ids'] = this.genreIds;
  //   data['id'] = this.id;
  //   data['original_language'] = this.originalLanguage;
  //   data['original_title'] = this.originalTitle;
  //   data['overview'] = this.overview;
  //   data['popularity'] = this.popularity;
  //   data['poster_path'] = this.posterPath;
  //   data['release_date'] = this.releaseDate;
  //   data['title'] = this.title;
  //   data['video'] = this.video;
  //   data['vote_average'] = this.voteAverage;
  //   data['vote_count'] = this.voteCount;
  //   return data;
  // }
}
