import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:filmes_app/core/error/failure.dart';
import 'package:filmes_app/core/usecases/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:filmes_app/features/domain/entities/film_data_entity.dart';
import 'package:filmes_app/features/domain/usecases/get_release_film_list_usecase.dart';

import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'film_release_event.dart';
part 'film_release_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class FilmReleaseBloc extends Bloc<FilmReleaseEvent, FilmReleaseState> {
  final GetReleaseFilmListUsecase getReleaseFilmList;

  FilmReleaseBloc({this.getReleaseFilmList}) : super(FilmReleaseInitial());
 
  @override
  Stream<FilmReleaseState> mapEventToState(FilmReleaseEvent event) async* {
    if (event is FetchReleaseFilmsData) {
      yield FilmReleaseLoading();
      final failureOrData = await getReleaseFilmList(NoParams());
      yield* _eitherLoadedOrErrorState(failureOrData);
    }
  }
}

Stream<FilmReleaseState> _eitherLoadedOrErrorState(
  Either<Failure, List<FilmDataEntity>> either,
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
