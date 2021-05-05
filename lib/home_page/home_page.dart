//import 'dart:io';
import 'package:filmes_app/home_page/film_list_container.dart';
import 'package:flutter/material.dart';

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
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 20),
            //titulo da lista de filmes
            TitleFilmList('Os Mais Populares'),
            //objeto - cria um novo card de filme com as informações passadas
            FilmListContainer(
                'https://api.themoviedb.org/3/movie/popular?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1'),
            //Título da outra lista de filmes
            TitleFilmList('Lançamentos'),
            //objeto - cria um novo card de filme com as informações passadas
            FilmListContainer(
                'https://api.themoviedb.org/3/movie/now_playing?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1'),
          ],
        ),
      ),
    );
  }
}
