import 'package:filmes_app/features/data/models/films_model.dart';
import 'package:filmes_app/features/presentation/widgets/film_information_box.dart';
import 'package:filmes_app/features/presentation/widgets/layouts_page.dart';
import 'package:filmes_app/features/presentation/widgets/title_film_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsPage extends StatefulWidget {
  final FilmModel filmData;

  const DetailsPage({Key key, this.filmData}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState(filmData);
}

class _DetailsPageState extends State<DetailsPage> {
  //VideoPlayerController _controller;
  final FilmModel filmData;

  _DetailsPageState(this.filmData);
  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '4QRdB4RAQMs',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: DrawerHome()),
        // Barra superior
        appBar: AppBar(
          title: Text('PipocaFilme'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bc_home_dd.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset: Offset(-3,3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                  //titulo da lista de filmes - populares
                  Column(
                    children: [
                      TitleFilmList('Vingadores Ultimato'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(padding:EdgeInsets.all(10), child: Icon(Icons.favorite, color: Colors.blueGrey[200], size: 30.0,)),
                          Container(padding:EdgeInsets.all(10),child: Icon(Icons.share, color: Colors.blueGrey[200], size: 30.0)),
                          Container(padding:EdgeInsets.all(10),child: Icon(Icons.info, color: Colors.blueGrey[200], size: 30.0)),
                          Container(padding:EdgeInsets.all(10),child: Icon(Icons.verified, color: Colors.blueGrey[200], size: 30.0)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'Avengers: Endgame é um filme de super-herói estadunidense de 2019, baseado na equipe Os Vingadores da Marvel Comics, produzido pela Marvel Studios e distribuído pela Walt Disney Studios Motion Pictures, sendo a sequência de The Avengers, de 2012, Avengers: Age of Ultron, de 2015, e Avengers: Infinity War, de 2018, e o vigésimo segundo filme do Universo Cinematográfico Marvel.',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
