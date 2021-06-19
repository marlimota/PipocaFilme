part of 'film_release_bloc.dart';

@immutable
abstract class FilmReleaseState extends Equatable {
  FilmReleaseState([List props = const <dynamic>[]]) : super(props);
}

//Estado inicial, quando o usuário não executou nenhuma ação e deve-se ter uma interface inicial
class FilmReleaseInitial extends FilmReleaseState {}

//Estado de carregamento - mostra uma progress bar - enquanto os filmes carregam, ou seja, a pi é lida
//retorna sucesso ou erro, caso a leitura não seja concluída
class FilmReleaseLoading extends FilmReleaseState {}

//Estado de carregamento concluído - leitura concluída
class FilmReleaseLoaded extends FilmReleaseState {
  final List<FilmData> filmList;

  FilmReleaseLoaded({this.filmList});

//sobreescreve a operação de igualdade
//Permite a atualização do estado - pois naturalmente com a operação de igualdade, isso não é possível
//Ou seja, permite a atualização a leitura da api
//compara não só o estado, mas também o conteúdo
//freezed faz o mesmo, mas com código reduzido?

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is FilmPopularLoaded && listEquals(other.filmList, filmList);
  // }

  // @override
  // int get hashCode => filmList.hashCode;
}

class FilmReleaseError extends FilmReleaseState {
  final String message;

  FilmReleaseError({this.message});

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;

  //   return other is FilmPopularError && other.message == message;
  // }

  // @override
  // int get hashCode => message.hashCode;
}
