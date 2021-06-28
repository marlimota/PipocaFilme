import 'package:dartz/dartz.dart';
import 'package:filmes_app/core/error/failure.dart';
import 'package:filmes_app/features/data/models/films_model.dart';

abstract class MovieRepository {
  //final moviesApiProvider = MoviesApiProvider();
 Future<Either<Failure, List<FilmModel>>> getPopularFilmList();
 Future<Either<Failure, List<FilmModel>>> getReleaseFilmList();
}

