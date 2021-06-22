// import 'dart:convert';
// import 'package:filmes_app/core/error/exceptions.dart';
// import 'package:filmes_app/features/data/models/films_model.dart';
// import 'package:filmes_app/features/domain/entities/page_data.dart';
// //import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// abstract class FilmLocalDataSource {
//   Future<List<FilmData>> getLastFilmData();
//   Future<void> cacheFilmData(List<FilmData> triviaToCache);
// }

// const CACHED_FILM_DATA = 'CACHED_FILM_DATA';

// class FilmLocalDataSourceImpl implements FilmLocalDataSource {
//   final SharedPreferences sharedPreferences;

//   FilmLocalDataSourceImpl({this.sharedPreferences});

//   @override
//   Future<List<FilmData>> getLastFilmData() {
//     final jsonString = sharedPreferences.getString('CACHED_FILM_DATA');
//     // Future which is immediately completed
//     if (jsonString != null) {
//       return Future.value(FilmData.fromJson(json.decode(jsonString)));
//     } else {
//       throw CacheExceptions();
//     }
//   }

//   @override
//   Future<void> cacheFilmData(List<FilmData> triviaToCache) {
//     return sharedPreferences.setString(
//       CACHED_FILM_DATA,
//       json.encode(triviaToCache.toJson()),
//     );
//   }
// }
