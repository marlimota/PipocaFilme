import 'package:filmes_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:filmes_app/core/usecases/usecase.dart';
import 'package:filmes_app/features/domain/entities/page_data.dart';
import 'package:filmes_app/features/domain/repositories/films_repository.dart';

class GetPopularMovieListUsecase implements UseCase<List<MovieData>, NoParams> {
  final MovieRepository repository;

  GetPopularMovieListUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieData>>> call() async {
    return await repository.getPopularMovieList();
  }
}
