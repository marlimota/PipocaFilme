part of 'film_popular_bloc.dart';

@immutable
abstract class FilmPopularState extends Equatable{
  FilmPopularState([List props = const <dynamic>[]]) : super();
} 

//Estado inicial, quando o usuário não executou nenhuma ação e deve-se ter uma interface inicial
class FilmPopularInitial extends FilmPopularState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class FilmPopularLoading extends FilmPopularState {
  @override
  List<Object> get props => throw UnimplementedError();
}

//Estado de carregamento concluído - leitura concluída
class FilmPopularLoaded extends FilmPopularState {
  final List<FilmModel> filmList;

  FilmPopularLoaded({this.filmList}) : super([filmList]);

  @override
  List<Object> get props => throw UnimplementedError();

}

class FilmPopularError extends FilmPopularState {
  final String message;

  FilmPopularError({this.message}) : super([message]);

  @override
  List<Object> get props => throw UnimplementedError();

}
