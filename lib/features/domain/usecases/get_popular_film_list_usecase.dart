import 'package:filmes_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:filmes_app/core/usecases/usecase.dart';
import 'package:filmes_app/features/domain/entities/film_data_entity.dart';
import 'package:filmes_app/features/domain/repositories/films_repository.dart';
 
class GetPopularFilmListUsecase implements UseCase<List<FilmDataEntity>, NoParams> {
  final FilmRepository repository;

  GetPopularFilmListUsecase(this.repository);

  @override
  Future<Either<Failure, List<FilmDataEntity>>> call(NoParams params) async {
    return await repository.getPopularFilmList();
  }
}
