import 'dart:async';
//import 'dart:convert';
import 'package:filmes_app/features/domain/repositories/films_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:filmes_app/features/domain/entities/page_data.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
//import 'package:http/http.dart' as http;
part 'film_popular_event.dart'; 
part 'film_popular_state.dart';

class FilmPopularBloc extends Bloc<FilmPopularEvent, FilmPopularState> {
  final MovieRepository _repository;
  FilmPopularBloc(this._repository) : super(FilmPopularInitial());

  @override
  Stream<FilmPopularState> mapEventToState(
    FilmPopularEvent event,
  ) async* {
    if (event is FetchPopularFilmsData) {
      //troca o estado do initial para o loading
      yield (FilmPopularLoading());
      List<FilmData> filmList = await _repository.getPopularFilmList();
      yield (FilmPopularLoaded(filmList)); //lista de filmes no results
      //cria a variavel response, faz a solicitação da url, recebe os dados e armazena na variavel response
      // final response = await http.get(Uri.parse(url));
      // //se o valor recebido da url solicitada tiver chegado corretamente (status code 200) da seguimento ao código, senão retorna erro
      // if (response.statusCode == 200) {
      //   //converte de string (response.body) para json (atraves do jsonDecode), ou seja, mapa de strings e variaveis dinamicas(tipo um objeto sem metodo) e depois converte para o tipo Pagedata e armazena na variavel
      //   var pageJson = jsonDecode(response.body);
      //   PageData pageDataObject = PageData.fromJson(pageJson);
      //troca de loading para loaded com a informação recebida

    }
  }
}
