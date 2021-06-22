import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmes_app/core/error/failure.dart';
import 'package:filmes_app/core/usecases/usecase.dart';
import 'package:filmes_app/features/domain/entities/page_data.dart';
import 'package:bloc/bloc.dart';
import 'package:filmes_app/features/domain/usecases/get_release_film_list.dart';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'film_release_event.dart';
part 'film_release_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class FilmReleaseBloc extends Bloc<FilmReleaseEvent, FilmReleaseState> {
  final GetReleaseFilmList getReleaseFilmList;

  FilmReleaseBloc({this.getReleaseFilmList}) : super(FilmReleaseInitial());

  @override
  Stream<FilmReleaseState> mapEventToState(FilmReleaseEvent event) async* {
    if (event is FetchReleaseFilmsData) {
      yield FilmReleaseLoading();
      final failureOrData = await getReleaseFilmList(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrData);
    }
  }

  //@override
  // Stream<FilmPopularState> mapEventToState(
  //   FilmPopularEvent event,
  // ) async* {
  //   if (event is FetchPopularFilmsData) {
  //     //troca o estado do initial para o loading
  //     yield (FilmPopularLoading());
  //     List<FilmData> filmList = await _repository.getPopularFilmList;
  //     yield (FilmPopularLoaded(filmList)); //lista de filmes no results
  //     //cria a variavel response, faz a solicitação da url, recebe os dados e armazena na variavel response
  //     // final response = await http.get(Uri.parse(url));
  //     // //se o valor recebido da url solicitada tiver chegado corretamente (status code 200) da seguimento ao código, senão retorna erro
  //     // if (response.statusCode == 200) {
  //     //   //converte de string (response.body) para json (atraves do jsonDecode), ou seja, mapa de strings e variaveis dinamicas(tipo um objeto sem metodo) e depois converte para o tipo Pagedata e armazena na variavel
  //     //   var pageJson = jsonDecode(response.body);
  //     //   PageData pageDataObject = PageData.fromJson(pageJson);
  //     //troca de loading para loaded com a informação recebida
  //   }
  // }
}

Stream<FilmReleaseState> _eitherLoadedOrErrorState(
  Either<Failure, List<FilmData>> either,
) async* {
  yield either.fold(
    (failure) => FilmReleaseError(message: _mapFailureToMessage(failure)),
    (filmList) => FilmReleaseLoaded(filmList: filmList),
  );
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected Error';
  }
}
