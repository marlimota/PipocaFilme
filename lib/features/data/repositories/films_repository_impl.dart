import 'package:dartz/dartz.dart';
import 'package:filmes_app/core/error/exceptions.dart';
import 'package:filmes_app/core/error/failure.dart';
import 'package:filmes_app/core/platform/network_info.dart';
import 'package:filmes_app/features/data/datasources/films_local_data_source.dart';
import 'package:filmes_app/features/data/datasources/films_remote_data_source.dart';
import 'package:filmes_app/features/domain/entities/page_data.dart';
import 'package:filmes_app/features/domain/repositories/films_repository.dart';

typedef Future<FilmData> _PopularOrRelease();

class FilmsRepositoryImpl implements MovieRepository {
  final FilmsRemoteDataSource remoteDataSource;
  final FilmLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FilmsRepositoryImpl(
      {this.localDataSource, this.remoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, FilmData>> getPopularFilmList() async {
    return await _getData(() {
      return remoteDataSource.getPopularFilm();
    });
  }
  // if (await networkInfo.isConnected) {
  //   try {
  //     final remotepopularFilm = await remoteDataSource.getPopularFilm();
  //     return Right(remotepopularFilm);
  //   } on ServerExceptions {
  //     return left(ServerFailure());
  //   }
  //   // } else {
  //   //   try {
  //   //     //final localTrivia = await localDataSource.getLastNumberTrivia();
  //   //     //return Right(localTrivia);
  //   //   } on CacheExceptions {
  //   //     return Left(CacheFailure());
  //   //   }
  //   // }
  // }

  @override
  Future<Either<Failure, FilmData>> getReleaseFilmList() async {
    return await _getData(() {
      return remoteDataSource.getReleaseFilm();
    });
  }

  Future<Either<Failure, FilmData>> _getData(
    _PopularOrRelease getPopularOrRelease,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await getPopularOrRelease();
        localDataSource.cacheFilmData(remoteData);
        return Right(remoteData);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia = await localDataSource.getLastFilmData();
        return Right(localTrivia);
      } on CacheExceptions {
        return Left(CacheFailure());
      }
    }
  }
}
