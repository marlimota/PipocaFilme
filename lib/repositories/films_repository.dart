import 'package:filmes_app/models/page_data.dart';
import 'package:filmes_app/repositories/film_provider.dart';

class MovieRepository {
  final moviesApiProvider = MoviesApiProvider();

  Future<List<FilmData>> getPopularFilmList() =>
      moviesApiProvider.getPopularFilmList();
  Future<List<FilmData>> getReleaseFilmList() =>
      moviesApiProvider.getReleaseFilmList();
}

// import 'package:dio/dio.dart';
// import 'package:filmes_app/models/page_data.dart';

// class FilmPopularRepository {
//   final dio = Dio();
//   final url =
//       'https://api.themoviedb.org/3/movie/popular?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1';

//   Future<List<FilmData>> fetchFilms() async {
//     final response = await dio.get(url);
//     final filmList = response.data as List;

//     List<FilmData> films = [];
//     for (var json in filmList) {
//       final film = FilmData.fromJson(json);
//       films.add(film);
//     }
//     return films;
//   }
// }