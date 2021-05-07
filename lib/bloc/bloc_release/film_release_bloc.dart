import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:filmes_app/api/page_data.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
part 'film_release_event.dart';
part 'film_release_state.dart';

class FilmReleaseBloc extends Bloc<FilmReleaseEvent, FilmReleaseState> {
  final String url =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1';
  FilmReleaseBloc() : super(FilmReleaseInitial());

  @override
  Stream<FilmReleaseState> mapEventToState(
    FilmReleaseEvent event,
  ) async* {
    if (event is FetchReleaseFilmsData) {
      try {
        //troca o estado do initial para o loading
        yield (FilmReleaseLoading());
        //cria a variavel response, faz a solicitação da url, recebe os dados e armazena na variavel response
        final response = await http.get(Uri.parse(url));
        //se o valor recebido da url solicitada tiver chegado corretamente (status code 200) da seguimento ao código, senão retorna erro
        if (response.statusCode == 200) {
          //converte de string (response.body) para json (atraves do jsonDecode), ou seja, mapa de strings e variaveis dinamicas(tipo um objeto sem metodo) e depois converte para o tipo Pagedata e armazena na variavel
          var pageJson = jsonDecode(response.body);
          PageData pageDataObject = PageData.fromJson(pageJson);
          //troca de loading para loaded com a informação recebida
          yield (FilmReleaseLoaded(
              pageDataObject.results)); //lista de filmes no results
        } else {
          yield (FilmReleaseError(response.statusCode.toString()));
        }
      } catch (e) {
        yield (FilmReleaseError(e));
        // 'Não foi possível carregar a lista de filme. Verifique a sua conexão com a internet.'));
      }
    }
  }
}
