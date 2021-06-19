import 'package:filmes_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:filmes_app/core/usecases/usecase.dart';
import 'package:filmes_app/features/domain/entities/page_data.dart';
import 'package:filmes_app/features/domain/repositories/films_repository.dart';

class GetReleaseFilmList implements UseCase<FilmData, NoParams> {
  final MovieRepository repository;

  GetReleaseFilmList(this.repository);

  @override
  Future<Either<Failure, FilmData>> call(NoParams params) async {
    return await repository.getReleaseFilmList();
  }
}