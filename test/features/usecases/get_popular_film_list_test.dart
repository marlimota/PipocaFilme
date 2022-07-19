// import 'package:filmes_app/features/domain/entities/page_data.dart';
// import 'package:filmes_app/features/domain/repositories/films_repository.dart';
// import 'package:filmes_app/features/domain/usecases/get_popular_film_list.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   final MovieRepository repository;
//   MovieData movieData = MovieData(
//     adult: true,
//     backdropPath: '',
//     genreIds: [0, 1],
//     id: 1,
//     originalLanguage: '',
//     originalTitle: '',
//     overview: '',
//     popularity: 4,
//     posterPath: '',
//     releaseDate: '',
//     title: '',
//     video: false,
//     voteAverage: 65,
//     voteCount: 52,
//   );
//   test('Deve retornar uma lista de MovieData', () {
//     GetPopularMovieList usecase = GetPopularMovieList(repository);

//     expect(
//         usecase,
//         MovieData(
//           adult: true,
//           backdropPath: '',
//           genreIds: [0, 1],
//           id: 1,
//           originalLanguage: '',
//           originalTitle: '',
//           overview: '',
//           popularity: 4,
//           posterPath: '',
//           releaseDate: '',
//           title: '',
//           video: false,
//           voteAverage: 65,
//           voteCount: 52,
//         ));
//   });
// }
