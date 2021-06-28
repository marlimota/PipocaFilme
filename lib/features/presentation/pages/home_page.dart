import 'package:filmes_app/features/data/models/films_model.dart';
import 'package:filmes_app/features/presentation/bloc/bloc_popular/film_popular_bloc.dart';
import 'package:filmes_app/features/presentation/bloc/bloc_release/film_release_bloc.dart';
import 'package:filmes_app/features/presentation/widgets/film_list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../injection_container.dart';
import '../widgets/layouts_page.dart';
import '../widgets/title_film_list.dart';

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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search_sharp),
            onPressed: () {},
          ),
        ],
      ),
      //todo o corpo do aplicativo - conteúdo
      body: Container(
        //imagem de fundo
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bc_home_dd.png"),
            fit: BoxFit.cover,
          ),
        ),
        //contéudo - duas listas horizontais e seus respectivos títulos
        child: ListView(
          children: [
            SizedBox(height: 8),
            //titulo da lista de filmes - populares
            TitleFilmList('Os Mais Populares'),
            //Define o que será feito de acordo com o estado ou mudança de estado
            BlocProvider(
              //Definição é feita de acordo com o Popular Cubit pois existe mais de um cubit
              //cria uma instancia do cubit que gerencia a lista de filmes populares
              create: (_) => sl<FilmPopularBloc>(),
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
                  return buildLoading();
                }
              }),
            ),
            SizedBox(height: 10),
            //Título da outra lista de filmes - lançamentos
            TitleFilmList('Lançamentos'),
            //objeto - cria um novo card de filme com as informações passadas
            BlocProvider(
              create: (_) => sl<FilmReleaseBloc>(),
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
                  return buildLoading();
                }
              }),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

Widget buildInitial() {
  return Padding(
    padding: const EdgeInsets.all(40.0),
    child: LinearProgressIndicator(
      backgroundColor: Colors.red,
      valueColor: AlwaysStoppedAnimation(Colors.yellow),
      minHeight: 10,
    ),
  );
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(
      backgroundColor: Colors.red[900],
      valueColor: AlwaysStoppedAnimation(Colors.yellow),
    ),
  );
}

Widget buildLoaded(List<FilmModel> filmList) {
  //objeto - cria um novo card de filme com as informações passadas
  return FilmListContainer(filmList: filmList);
}

// Widget error(List<FilmData> filmList) {
//   return null;
// }
