part of 'film_popular_bloc.dart';

@immutable
abstract class FilmPopularEvent {}

class FetchPopularFilmsData extends FilmPopularEvent {
  FetchPopularFilmsData();
}
