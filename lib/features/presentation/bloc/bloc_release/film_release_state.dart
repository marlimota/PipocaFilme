part of 'film_release_bloc.dart';

@immutable
abstract class FilmReleaseState extends Equatable {
  FilmReleaseState([List props = const <dynamic>[]]) : super();
}

//Estado inicial, quando o usuário não executou nenhuma ação e deve-se ter uma interface inicial
class FilmReleaseInitial extends FilmReleaseState {
  @override
  List<Object> get props => throw UnimplementedError();
}

//Estado de carregamento - mostra uma progress bar - enquanto os filmes carregam, ou seja, a pi é lida
//retorna sucesso ou erro, caso a leitura não seja concluída
class FilmReleaseLoading extends FilmReleaseState {
  @override
  List<Object> get props => throw UnimplementedError();
}

//Estado de carregamento concluído - leitura concluída
class FilmReleaseLoaded extends FilmReleaseState {
  final List<FilmDataEntity> filmList;

  FilmReleaseLoaded({this.filmList});

  @override
  List<Object> get props => throw UnimplementedError();
}

class FilmReleaseError extends FilmReleaseState {
  final String message;

  FilmReleaseError({this.message});

  @override
  List<Object> get props => throw UnimplementedError();
}
