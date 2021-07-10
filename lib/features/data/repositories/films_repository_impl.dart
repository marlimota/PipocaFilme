import 'package:dartz/dartz.dart';
import 'package:filmes_app/core/error/exceptions.dart';
import 'package:filmes_app/core/error/failure.dart';
import 'package:filmes_app/core/platform/network_info.dart';
import 'package:filmes_app/features/data/datasources/films_remote_data_source.dart';
import 'package:filmes_app/features/data/models/film_model.dart';
import 'package:filmes_app/features/domain/repositories/films_repository.dart';

class FilmsRepositoryImpl implements FilmRepository {
  final FilmsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  FilmsRepositoryImpl({this.remoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, List<FilmModel>>> getPopularFilmList() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getPopularFilmList();
        //localDataSource.cacheFilmData(remoteData);
        return Right(remoteData);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<FilmModel>>> getReleaseFilmList() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getReleaseFilmList();
        //localDataSource.cacheFilmData(remoteData);
        return Right(remoteData);
      } on ServerExceptions {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }
}
