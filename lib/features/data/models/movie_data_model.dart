import 'package:filmes_app/features/domain/entities/page_data.dart';

class MovieDataModel extends MovieData {
  MovieDataModel({
    final bool adult,
    final String backdropPath,
    final List<int> genreIds,
    final int id,
    final String originalLanguage,
    final String originalTitle,
    final String overview,
    final num popularity,
    final String posterPath,
    final String releaseDate,
    final String title,
    final bool video,
    final num voteAverage,
    final int voteCount,
  }) : super(
            adult: adult,
            backdropPath: backdropPath,
            genreIds: genreIds,
            id: id,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title,
            video: video,
            voteAverage: voteAverage,
            voteCount: voteCount);

  factory MovieDataModel.fromJson(Map<String, dynamic> json) {
    return MovieDataModel(
      adult: json['adult'],
      backdropPath: json['backdropPath'],
      genreIds: json['genreIds'],
      id: json['id'],
      originalLanguage: json['originalLanguage'],
      originalTitle: json['originalTitle'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['posterPath'],
      releaseDate: json['releaseDate'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['voteAverage'],
      voteCount: json['voteCount'],
    );
  }

  //converte de volta para o formato json
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  // }
}
