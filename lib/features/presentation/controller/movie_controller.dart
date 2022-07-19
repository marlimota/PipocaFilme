import 'package:filmes_app/features/domain/usecases/get_popular_film_list.dart';
import 'package:filmes_app/features/domain/usecases/get_release_film_list.dart';

class MovieController {
  final GetPopularMovieListUsecase _getPopularMovieList;
  final GetReleaseMovieListUsecase _getReleaseMovieList;

  MovieController(this._getPopularMovieList, this._getReleaseMovieList);

  getPopularMovieList() async {
    var result = await _getPopularMovieList();
  }

  getReleaseMovieList() async {
    var result = await _getReleaseMovieList();
  }
}
