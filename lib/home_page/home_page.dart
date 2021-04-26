//import 'dart:io';
import 'package:filmes_app/home_page/film_list_container.dart';
import 'package:flutter/material.dart';
import 'film_list_data.dart';
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
      //corpo da home
      body: ListView(
        children: [
          //titulo da lista de filmes
          TitleFilmList('Os Mais Populares'),
          //objeto - cria um novo card de filme com as informações passadas
          FilmListContainer(filmListPopulares),
          //Título da outra lista de filmes
          TitleFilmList('Lançamentos'),
          //objeto - cria um novo card de filme com as informações passadas
          FilmListContainer(filmListCinema),
        ],
      ),
    );
  }
}
