import 'package:dartz/dartz.dart';
import 'package:filmes_app/core/error/failure.dart';
import 'package:filmes_app/features/domain/entities/page_data.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<MovieData>>> getPopularMovieList();
  Future<Either<Failure, List<MovieData>>> getReleaseMovieList();
}
