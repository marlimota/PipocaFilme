import 'package:filmes_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:filmes_app/core/usecases/usecase.dart';
import 'package:filmes_app/features/data/models/films_model.dart';
import 'package:filmes_app/features/domain/repositories/films_repository.dart';

class GetReleaseFilmList implements UseCase<List<FilmModel>, NoParams> {
  final MovieRepository repository;

  GetReleaseFilmList(this.repository);

  @override
  Future<Either<Failure, List<FilmModel>>> call(NoParams params) async {
    return await repository.getReleaseFilmList();
  }
}