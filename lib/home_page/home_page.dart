import 'package:filmes_app/api/page_data.dart';
import 'package:filmes_app/bloc/bloc_popular/film_popular_bloc.dart';
import 'package:filmes_app/bloc/bloc_release/film_release_bloc.dart';
import 'package:filmes_app/home_page/film_list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layouts_page/layouts_page.dart';
import 'title_film_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra Lateral
      drawer: Drawer(child: DrawerHome()),
      // Barra superior
      appBar: AppBar(
        title: Text('PipocaFilme'),
        actions: [
          CustomSwitch(),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 12),
          //titulo da lista de filmes
          TitleFilmList('Os Mais Populares'),
          //Define o que será feito de acordo com o estado ou mudança de estado
          BlocProvider(
            //Definição é feita de acordo com o Popular Cubit pois existe mais de um cubit
            //cria uma instancia do cubit que gerencia a lista de filmes populares
            create: (context) => FilmPopularBloc(),
            //bloc consumer:possui opções de listener(apenas notifica caso aconteça mudança de estado) e builder(constrói com a mudança de estado) no mesmo Widget
            child: BlocConsumer<FilmPopularBloc, FilmPopularState>(
                //apenas escuta as mudanças do Cubit sem construir um widget
                //permite ser notificado caso o estado altere ou troca de página
                listener: (context, state) {
              if (state is FilmPopularError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
                //builder: constrói o widget
                builder: (context, state) {
              if (state is FilmPopularInitial) {
                //Faz uma referência "facilitada" ao cubit responsável por gerenciar essa list
                //chama a função fetchFilmsData do FilmPopularCubit
                context.watch<FilmPopularBloc>().add(FetchPopularFilmsData());
                return buildInitial();
              } else if (state is FilmPopularLoading) {
                return buildLoading();
              } else if (state is FilmPopularLoaded) {
                return buildLoaded(state.filmList);
              } else {
                //erro - continua carregando
                return buildLoading();
              }
            }),
          ),
          //Título da outra lista de filmes
          TitleFilmList('Lançamentos'),
          //objeto - cria um novo card de filme com as informações passadas
          BlocProvider(
            create: (context) => FilmReleaseBloc(),
            child: BlocConsumer<FilmReleaseBloc, FilmReleaseState>(
                listener: (context, state) {
              if (state is FilmReleaseError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            }, builder: (context, state) {
              if (state is FilmReleaseInitial) {
                context.watch<FilmReleaseBloc>().add(FetchReleaseFilmsData());
                return buildInitial();
              } else if (state is FilmReleaseLoading) {
                return buildLoading();
              } else if (state is FilmReleaseLoaded) {
                //retorna a lista de filme que é carregada com esse estado
                return buildLoaded(state.filmList);
              } else {
                //erro - continua carregando
                return buildLoading();
              }
            }),
          ),
        ],
        // children: [BlocConsumer<FilmCubit, FilmState>(listener: (context, state) {
        //   if (state is FilmError) {
        //     Scaffold.of(context).showSnackBar(
        //       SnackBar(
        //         content: Text(state.message),
        //       ),
        //     );
        //   }
        // }, builder: (context, state) {
        //   if (state is FilmInitial) {
        //     final filmCubit = context.bloc<FilmCubit>();
        //     filmCubit.fetchFilmsData(filmCubit.url);
        //     return buildInitial();
        //   } else if (state is FilmLoading) {
        //     return buildLoading();
        //   } else if (state is FilmLoaded) {
        //     return buildLoaded(state.filmList);
        //   } else {
        //     //erro
        //     return buildLoading();
        //   }
        // }),
        // SizedBox(height: 20),
        // //titulo da lista de filmes
        // TitleFilmList('Os Mais Populares'),
        // //objeto - cria um novo card de filme com as informações passadas
        // FilmListContainer(
        //     'https://api.themoviedb.org/3/movie/popular?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1'),
        // //Título da outra lista de filmes
        // TitleFilmList('Lançamentos'),
        // //objeto - cria um novo card de filme com as informações passadas
        // FilmListContainer(
        //     'https://api.themoviedb.org/3/movie/now_playing?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1'),
      ),
    );
  }
}

Widget buildInitial() {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: LinearProgressIndicator(
      backgroundColor: Colors.pink,
      valueColor: AlwaysStoppedAnimation(Colors.blue),
      minHeight: 10,
    ),
  );
}

Widget buildLoading() {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: LinearProgressIndicator(
      backgroundColor: Colors.pink,
      valueColor: AlwaysStoppedAnimation(Colors.blue),
      minHeight: 10,
    ),
  );
}

Widget buildLoaded(List<FilmData> filmList) {
  //objeto - cria um novo card de filme com as informações passadas
  return FilmListContainer(filmList: filmList);
}
