import 'package:filmes_app/features/data/models/film_model.dart';
import 'package:filmes_app/features/presentation/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsPage extends StatefulWidget {
  final FilmModel filmData;

  const DetailsPage({Key key, this.filmData}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState(filmData);
}

class _DetailsPageState extends State<DetailsPage> {
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
        //drawer: Drawer(child: DrawerHome()),
        // Barra de menu inferior
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white,
          backgroundColor: Color.fromARGB(230, 199, 19, 19),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              //activeIcon: HomePage(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Salvos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Marli',
            ),
          ],
        ),
        // Barra superior
        appBar: AppBar(
          title: Text('PipocaFilme'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
          ],
          backgroundColor: Color.fromARGB(255, 177, 1, 1),
          elevation: 10,
          textTheme: TextTheme(
            headline6: TextStyle(
              // headline6 is used for setting title's theme
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          shadowColor: Colors.amber[50],
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
                  Stack(
                    children: [
                      Container(
                        height: 300,
                        margin: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          //color: Color.fromARGB(210, 63, 61, 61),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5,
                              offset:
                                  Offset(7, 7), // changes position of shadow
                            ),
                          ],
                          image: DecorationImage(
                              image: NetworkImage(filmData.backdropPath),
                              fit: BoxFit.cover),
                        ),
                      ),
                      // child: YoutubePlayer(
                      //   controller: _controller,
                      //   showVideoProgressIndicator: false,
                      // ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 22),
                        //height: 800,
                        child: Positioned.fill(
                          child: Align(
                            alignment: Alignment(0.9, 3),
                            child: Column(
                              children: [
                                Icon(Icons.favorite,
                                    color: Color.fromARGB(160, 253, 243, 243),
                                    size: 30),
                                SizedBox(height: 12),
                                Icon(Icons.share,
                                    color: Color.fromARGB(160, 253, 243, 243),
                                    size: 30),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //titulo, nota e descrição
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(210, 63, 61, 61),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(5, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            filmData.title,
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  blurRadius: 5.0,
                                  color: Colors.amber[600],
                                  //offset: Offset(0.0, 2.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 40, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(filmData.releaseDate,
                                  style: TextStyle(color: Colors.white)),
                              Icon(
                                Icons.circle,
                                size: 8,
                                color: Colors.white,
                              ),
                              Text('Ação/Aventura',
                                  style: TextStyle(color: Colors.white)),
                              Icon(
                                Icons.circle,
                                size: 8,
                                color: Colors.white,
                              ),
                              Text('2h 46min',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        Container(
                          child: RatingBar.builder(
                            itemSize: 20.0,
                            initialRating: filmData.voteAverage / 2,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber[600],
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            filmData.overview,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(210, 63, 61, 61),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 3,
                          offset: Offset(5, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 14.0),
                    padding: EdgeInsets.all(14.0),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Elenco',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    blurRadius: 5.0,
                                    color: Colors.white24,
                                    //offset: Offset(0.0, 2.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Column(
                              children: [
                                ClipOval(
                                  child: Image.network(
                                    'https://rollingstone.uol.com.br/media/_versions/brie_larson-frazer_harrison-getty_images_widelg.jpg',
                                    fit: BoxFit.cover,
                                    width: 80,
                                    height: 80,
                                  ),
                                ),
                                Text(
                                  'Brie Larson',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
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
