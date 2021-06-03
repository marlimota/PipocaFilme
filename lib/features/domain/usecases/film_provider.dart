import 'dart:async';
import 'dart:convert';

import 'package:filmes_app/features/domain/entities/page_data.dart';
import 'package:http/http.dart' as http;
  
class MoviesApiProvider {
  final String urlPopular =
      'https://api.themoviedb.org/3/movie/popular?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1';
  final urlRelease =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1';

  Future<List<FilmData>> getPopularFilmList() async {
    //cria a variavel response, faz a solicitação da url, recebe os dados e armazena na variavel response
    final response = await http.get(Uri.parse(urlPopular));
    //se o valor recebido da url solicitada tiver chegado corretamente (status code 200) da seguimento ao código, senão retorna erro
    if (response.statusCode == 200) {
      //converte de string (response.body) para json (atraves do jsonDecode), ou seja, mapa de strings e variaveis dinamicas(tipo um objeto sem metodo) e depois converte para o tipo Pagedata e armazena na variavel
      var pageJson = jsonDecode(response.body);
      PageData pageDataObject = PageData.fromJson(pageJson);
      return pageDataObject.results;
    }
    return null;
  }

  Future<List<FilmData>> getReleaseFilmList() async {
    //cria a variavel response, faz a solicitação da url, recebe os dados e armazena na variavel response
    final response = await http.get(Uri.parse(urlRelease));
    //se o valor recebido da url solicitada tiver chegado corretamente (status code 200) da seguimento ao código, senão retorna erro
    if (response.statusCode == 200) {
      //converte de string (response.body) para json (atraves do jsonDecode), ou seja, mapa de strings e variaveis dinamicas(tipo um objeto sem metodo) e depois converte para o tipo Pagedata e armazena na variavel
      var pageJson = jsonDecode(response.body);
      PageData pageDataObject = PageData.fromJson(pageJson);
      return pageDataObject.results;
    }
    return null;
  }
}
