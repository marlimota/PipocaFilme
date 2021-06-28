part of 'film_popular_bloc.dart';

@immutable
abstract class FilmPopularEvent extends Equatable{
  FilmPopularEvent([List props = const <dynamic>[]]) : super();
}

class FetchPopularFilmsData extends FilmPopularEvent {
  FetchPopularFilmsData();

  @override
  List<Object> get props => throw UnimplementedError(); 
}

 