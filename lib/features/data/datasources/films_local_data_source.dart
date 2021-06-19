import 'dart:convert';
 
import 'package:filmes_app/features/data/models/films_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FilmLocalDataSource {
  Future<FilmModel> getLastFilmData();
  Future<void> cacheFilmData(FilmModel triviaToCache);
}

const CACHED_FILM_DATA = 'CACHED_FILM_DATA';

class FilmLocalDataSourceImpl implements FilmLocalDataSource {
  final SharedPreferences sharedPreferences;

  FilmLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheFilmData(FilmModel triviaToCache) {
    return sharedPreferences.setString(
    CACHED_FILM_DATA,
    json.encode(triviaToCache.toJson()),
  );
  }

  @override
  Future<FilmModel> getLastFilmData() {
  final jsonString = sharedPreferences.getString('CACHED_FILM_DATA');
  // Future which is immediately completed
    return Future.value(FilmModel.fromJson(json.decode(jsonString)));
  }
}