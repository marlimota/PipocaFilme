import 'package:filmes_app/features/data/models/films_model.dart';
import 'package:filmes_app/features/presentation/pages/details_page.dart';
import 'package:filmes_app/features/presentation/widgets/app_InfinitySingleChildScrollView.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
 
//coluna de cada filme
class FilmInformationBox extends StatelessWidget {
  final FilmModel filmData;

  const FilmInformationBox({Key key, this.filmData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
              height: 210,
              width: 145,
              margin: EdgeInsets.symmetric(horizontal: 11.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.transparent,
                image: DecorationImage(
                    image: NetworkImage(filmData.posterPath), 
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 3,
                    offset: Offset(5, 5), // changes position of shadow
                  ),
                ],
              ),
            ),
            Container(
              child: Positioned.fill(
                child: Align(
                  alignment: Alignment(0.8,-1.0),
                  child: InformationMenuBox(),
                ),
              ),
            ),
            Container(
              child: Positioned.fill(
                child: Align(
                  alignment: Alignment(-0.7, 1.1),
                  child: Stack(
                    children: <Widget>[
                      ClipOval(
                        child: Container(
                          width: 33,
                          height: 33,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(180, 82, 84, 92),
                          ),
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                            value: filmData.voteAverage * 0.1,
                            //ler da api
                            backgroundColor: Colors.blueGrey[300],
                            valueColor: getScoreColor(filmData.voteAverage),
                          ),
                        ),
                      ),
                      Container(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 8),
                        child: Text(
                          filmData.voteAverage.toDouble().toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0),
                        ),
                        //ler da api
                      )),
                    ],
                  ),
                ),

                // Image.asset(
                //   'assets/images/nota.png',
                //   width: 30,
                // ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        //titulo e data dos filmes
        Column(
          children: [
            Container(
              width: 130,
              child: InfinitySingleChildScrollView(
                  text: filmData.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  )),
            ),
            SizedBox(height: 5),
            Container(
                width: 130,
                child: Text(
                  filmData.releaseDate,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}

Animation<Color> getScoreColor(num score) {
  return AlwaysStoppedAnimation<Color>(
      HSVColor.fromAHSV(1, (score * 10.0) + 10, 1, 0.75).toColor());
}

class InformationMenuBox extends StatelessWidget {
  final FilmModel filmData;

  const InformationMenuBox({
    Key key,
    this.filmData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Tuple2<IconData, String>>(
      icon: Icon(
        Icons.pending_sharp,
        color: Color.fromARGB(180, 189, 185, 185),
        size: 36,
      ),
      onSelected: choiceAction,
      color: Color.fromARGB(210, 63, 61, 61),
      itemBuilder: (BuildContext context) {
        return Constants.choices.map((Tuple2<IconData, String> choice) {
          return PopupMenuItem<Tuple2<IconData, String>>(
              value: choice,
              child: Row(
                children: [
                  Icon(
                    choice.item1,
                    color: Color.fromARGB(180, 189, 185, 185),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(0, 237, 238, 245),
                        shadowColor: Color.fromARGB(0, 0, 0, 0),
                        padding: EdgeInsets.all(0)),
                    child: Text(
                      choice.item2,
                      style:
                          TextStyle(color: Color.fromARGB(180, 189, 185, 185)),
                    ),
                    onPressed: () {
                      if (choice == Constants.SecondItem) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                      filmData: filmData,
                                    )));
                      } else if (choice == Constants.FirstItem) {
                        print('salva filme na lista de favoritos');
                      }
                    },
                  )
                ],
              ));
        }).toList();
      },
    );
    // return IconButton(
    //   icon: const Icon(Icons.pending_sharp),
    //   color: Color.fromARGB(180, 138, 140, 146),
    //   iconSize: 36,
    //   onPressed: () {},
    // );
  }
}

class Constants {
  static const Tuple2<IconData, String> FirstItem =
      Tuple2<IconData, String>(Icons.favorite, ' Favorito');
  static const Tuple2<IconData, String> SecondItem =
      Tuple2<IconData, String>(Icons.info, ' Detalhes');

  static const List<Tuple2<IconData, String>> choices =
      <Tuple2<IconData, String>>[
    FirstItem,
    SecondItem,
  ];
}

void choiceAction(Tuple2<IconData, String> choice) {}
