import 'dart:convert';
import 'package:filmes_app/core/error/exceptions.dart';
import 'package:filmes_app/features/data/models/page_data_model.dart';
//import 'package:filmes_app/features/data/models/films_model.dart';
import 'package:filmes_app/features/domain/entities/page_data.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieData>> getPopularFilmList();
  Future<List<MovieData>> getReleaseFilmList();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({this.client});

  @override
  Future<List<MovieData>> getPopularFilmList() async {
    final response = await client.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      PageData pageData = PageDataModel.fromJson(json.decode(response.body));
      List<MovieData> filmDataList = pageData.results;
      return filmDataList;
    } else {
      throw ServerExceptions();
    }
  }

  @override
  Future<List<MovieData>> getReleaseFilmList() async {
    final response = await client.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      PageData pageData = PageDataModel.fromJson(json.decode(response.body));
      List<MovieData> filmDataList = pageData.results;
      return filmDataList;
    } else {
      throw ServerExceptions();
    }
  }
}
