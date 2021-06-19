import 'package:filmes_app/features/domain/entities/page_data.dart';

class FilmModel extends FilmData {
  FilmModel({
    bool adult,
    String backdropPath,
    List<int> genreIds,
    int id,
    String originalLanguage,
    String originalTitle,
    String overview,
    num popularity,
    String posterPath,
    String releaseDate,
    String title,
    bool video,
    num voteAverage,
    int voteCount,
  });

  factory FilmModel.fromJson(Map<String, dynamic> json) {
    return FilmModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: "https://www.themoviedb.org/t/p/w220_and_h330_face" +
          json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return{
    'adult': this.adult,
    'backdrop_path': this.backdropPath,
    'genre_ids': this.genreIds,
    'id': this.id,
    'original_language':this.originalLanguage,
    'original_title':this.originalTitle,
    'overview':this.overview,
    'popularity':this.popularity,
    'poster_path':this.posterPath,
    'release_date': this.releaseDate,
    'title':this.title,
    'video':this.video,
    'vote_average': this.voteAverage,
    'vote_count': this.voteCount,
    };
  }
}
