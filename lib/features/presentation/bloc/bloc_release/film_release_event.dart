part of 'film_release_bloc.dart';

@immutable
abstract class FilmReleaseEvent {}

class FetchReleaseFilmsData extends FilmReleaseEvent {
  FetchReleaseFilmsData();
}
