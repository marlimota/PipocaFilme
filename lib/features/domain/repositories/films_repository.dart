import 'package:dartz/dartz.dart';
import 'package:filmes_app/core/error/failure.dart';
import 'package:filmes_app/features/domain/entities/film_data_entity.dart';

abstract class FilmRepository {
  Future<Either<Failure, List<FilmDataEntity>>> getPopularFilmList();
  Future<Either<Failure, List<FilmDataEntity>>> getReleaseFilmList();
}
