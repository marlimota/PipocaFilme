import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmes_app/core/error/failure.dart';
import 'package:filmes_app/core/usecases/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:filmes_app/features/domain/entities/film_data_entity.dart';
import 'package:filmes_app/features/domain/usecases/get_popular_film_list_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
part 'film_popular_event.dart';
part 'film_popular_state.dart';
 
const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class FilmPopularBloc extends Bloc<FilmPopularEvent, FilmPopularState> {
  final GetPopularFilmListUsecase getPopularFilmList;

  FilmPopularBloc({this.getPopularFilmList}) : super(FilmPopularInitial());

  @override
  Stream<FilmPopularState> mapEventToState(FilmPopularEvent event) async* { 
    if (event is FetchPopularFilmsData) {
      yield FilmPopularLoading();
      final failureOrData = await getPopularFilmList(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrData);
    }
  }
}

Stream<FilmPopularState> _eitherLoadedOrErrorState(
  Either<Failure, List<FilmDataEntity>> either,
) async* {
  yield either.fold(
    (failure) => FilmPopularError(message: _mapFailureToMessage(failure)),
    (filmList) => FilmPopularLoaded(filmList: filmList),
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
