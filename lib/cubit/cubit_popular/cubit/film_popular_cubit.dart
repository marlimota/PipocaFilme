import 'package:bloc/bloc.dart';
import 'package:filmes_app/models/page_data.dart';
import 'package:filmes_app/repositories/films_repository.dart';
import 'package:flutter/foundation.dart';

import 'package:meta/meta.dart';

part 'film_popular_state.dart';

class FilmPopularCubit extends Cubit<FilmPopularState> {
  final MovieRepository _repository;
  FilmPopularCubit(this._repository) : super(FilmPopularInitial());

  Future<void> fetchFilmsData() async {
    //troca o estado do initial para o loading
    emit(FilmPopularLoading());
    //troca de loading para loaded com a informação recebida
    List<FilmData> filmList = await _repository.getPopularFilmList();
    emit(FilmPopularLoaded(filmList)); //lista de filmes no results
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
