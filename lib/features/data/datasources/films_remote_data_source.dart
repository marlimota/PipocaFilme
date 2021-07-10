import 'dart:convert';
import 'package:filmes_app/core/error/exceptions.dart';
import 'package:filmes_app/core/utils/api_keys.dart';
import 'package:filmes_app/features/data/datasources/endpoints/FilmsEndPoints.dart';
import 'package:filmes_app/features/data/models/film_model.dart';
import 'package:filmes_app/features/domain/entities/page_data.dart';
import 'package:http/http.dart' as http;

abstract class FilmsRemoteDataSource {
  Future<List<FilmModel>> getPopularFilmList();
  Future<List<FilmModel>> getReleaseFilmList();
}

class FilmsRemoteDataSourceImpl implements FilmsRemoteDataSource {
  final http.Client client;

  FilmsRemoteDataSourceImpl({this.client});

  @override
  Future<List<FilmModel>> getPopularFilmList() async {
    final response = await client.get(
      Uri.parse(
          FilmEndpoints.linkApiPopular(ApiKeys.apiKey)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      PageData pageData = PageData.fromJson(json.decode(response.body));
      List<FilmModel> filmDataList = pageData.results;
      return filmDataList;
    } else {
      throw ServerExceptions();
    }
  }

  @override
  Future<List<FilmModel>> getReleaseFilmList() async {
    final response = await client.get(
      Uri.parse(
          FilmEndpoints.linkApiRelease(ApiKeys.apiKey)),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      PageData pageData = PageData.fromJson(json.decode(response.body));
      List<FilmModel> filmDataList = pageData.results;
      return filmDataList;
    } else {
      throw ServerExceptions();
    }
  }
}
