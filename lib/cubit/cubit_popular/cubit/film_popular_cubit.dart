import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:filmes_app/api/page_data.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'film_popular_state.dart';

class FilmPopularCubit extends Cubit<FilmPopularState> {
  final String url =
      'https://api.themoviedb.org/3/movie/popular?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1';

  FilmPopularCubit() : super(FilmPopularInitial());

  Future<void> fetchFilmsData() async {
    try {
      //troca o estado do initial para o loading
      emit(FilmPopularLoading());
      //cria a variavel response, faz a solicitação da url, recebe os dados e armazena na variavel response
      final response = await http.get(Uri.parse(url));
      //se o valor recebido da url solicitada tiver chegado corretamente (status code 200) da seguimento ao código, senão retorna erro
      if (response.statusCode == 200) {
        //converte de string (response.body) para json (atraves do jsonDecode), ou seja, mapa de strings e variaveis dinamicas(tipo um objeto sem metodo) e depois converte para o tipo Pagedata e armazena na variavel
        var pageJson = jsonDecode(response.body);
        PageData pageDataObject = PageData.fromJson(pageJson);
        //troca de loading para loaded com a informação recebida
        emit(FilmPopularLoaded(
            pageDataObject.results)); //lista de filmes no results
      } else {
        emit(FilmPopularError(response.statusCode.toString()));
        return null;
      }
    } catch (e) {
      emit(FilmPopularError(e));
      // 'Não foi possível carregar a lista de filme. Verifique a sua conexão com a internet.'));
      return null;
    }
    //   try {

    //     emit(FilmLoading());
    //     final film = await Uri.parse(url).getFilmsData(film);
    //     emit(FilmLoaded(film));
    //   } on NetworkException {
    //     emit(FilmError(
    //         'Não foi possível carregar a lista de filme. Verifique a sua conexão com a internet.'));
    //   }
    // }
  }
}
