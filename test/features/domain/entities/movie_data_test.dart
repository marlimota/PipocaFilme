import 'package:filmes_app/features/domain/entities/movie_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MovieData movieData = MovieData(
    adult: true,
    backdropPath: '',
    genreIds: [0, 1],
    id: 1,
    originalLanguage: '',
    originalTitle: '',
    overview: '',
    popularity: 4,
    posterPath: '',
    releaseDate: '',
    title: '',
    video: false,
    voteAverage: 65,
    voteCount: 52,
  );
  test('Expect MovieDataEntity dont be null', () {
    expect(movieData, isNotNull);
  });
}
