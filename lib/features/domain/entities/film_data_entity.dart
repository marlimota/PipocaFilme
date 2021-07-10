//Define os atributos do objeto filme
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class FilmDataEntity extends Equatable {
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

  FilmDataEntity(
      {@required this.adult,
      @required this.backdropPath,
      @required this.genreIds,
      @required this.id,
      @required this.originalLanguage,
      @required this.originalTitle,
      @required this.overview,
      @required this.popularity,
      @required this.posterPath,
      @required this.releaseDate,
      @required this.title,
      @required this.video,
      @required this.voteAverage,
      @required this.voteCount});

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
}
