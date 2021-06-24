import 'package:filmes_app/features/domain/entities/page_data.dart';
import 'package:filmes_app/features/presentation/widgets/layouts_page.dart';
import 'package:filmes_app/features/presentation/widgets/title_film_list.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailsPage extends StatefulWidget {
  final FilmData filmData;

  const DetailsPage({Key key, this.filmData}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState(filmData);
}

class _DetailsPageState extends State<DetailsPage> {
  VideoPlayerController _controller;
  final FilmData filmData;

  _DetailsPageState(this.filmData);

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: DrawerHome()),
        // Barra superior
        appBar: AppBar(title: Text('PipocaFilme'), actions: [CustomSwitch()]),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bc_home_dd.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: [
              SizedBox(height: 8),
              //titulo da lista de filmes - populares
              TitleFilmList('Vingadores Ultimato'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  color: Color.fromARGB(60, 124, 122, 122),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 3,
                                  offset: Offset(
                                    5,
                                    5,
                                  ), // changes position of shadow
                                )
                              ]),
                              child: _controller.value.initialized
                                  ? AspectRatio(
                                      aspectRatio:
                                          _controller.value.aspectRatio,
                                      child: VideoPlayer(_controller),
                                    )
                                  : Container(),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 100),
                            alignment: Alignment.center,
                            child: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  _controller.value.isPlaying
                                      ? _controller.pause()
                                      : _controller.play();
                                });
                              },
                              backgroundColor: Colors.red,
                              child: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Avengers: Endgame é um filme de super-herói estadunidense de 2019, baseado na equipe Os Vingadores da Marvel Comics, produzido pela Marvel Studios e distribuído pela Walt Disney Studios Motion Pictures, sendo a sequência de The Avengers, de 2012, Avengers: Age of Ultron, de 2015, e Avengers: Infinity War, de 2018, e o vigésimo segundo filme do Universo Cinematográfico Marvel.',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
