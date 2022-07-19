import 'package:dartz/dartz.dart';
import 'package:filmes_app/core/error/exceptions.dart';
import 'package:filmes_app/core/error/failure.dart';
import 'package:filmes_app/core/platform/network_info.dart';
import 'package:filmes_app/features/data/datasources/films_remote_data_source.dart';
import 'package:filmes_app/features/domain/entities/page_data.dart';
import 'package:filmes_app/features/domain/repositories/films_repository.dart';

//typedef Future<List<FilmData>> _PopularOrRelease();

class FilmsRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  //final FilmLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FilmsRepositoryImpl({this.remoteDataSource, this.networkInfo});

  @override
  Future<Either<Failure, List<MovieData>>> getPopularMovieList() async {
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
  Future<Either<Failure, List<MovieData>>> getReleaseMovieList() async {
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
