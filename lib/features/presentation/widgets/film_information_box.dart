import 'package:filmes_app/features/presentation/widgets/app_InfinitySingleChildScrollView.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

//coluna de cada filme
class FilmInformationBox extends StatelessWidget {
  FilmInformationBox(this.filmPoster, this.title, this.subtitle, this.score);

  final filmPoster;
  final title;
  final subtitle;
  final score;

  @override
  Widget build(BuildContext context) {
    // Stack(
    //   children: [
    //     Container(
    //       width: 20,
    //       height: 20,
    //       child: CircularProgressIndicator(
    //         strokeWidth: 2,
    //         value: 0.75,
    //         backgroundColor: Colors.blueAccent,
    //         valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
    //       ),
    //     ),
    //     Center(
    //       child: Text(
    //         '75%',
    //         //style: AppTextStyles.heading,
    //       ),
    //     ),
    //   ],
    // );
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
                    image: NetworkImage(filmPoster), fit: BoxFit.cover),
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
              width: 155,
              child: Align(
                alignment: Alignment.topRight,
                child: InformationMenuBox(),
              ),
            ),
            Container(
              height: 225,
              margin: EdgeInsets.symmetric(horizontal: 22.0),
              alignment: Alignment.bottomLeft,
              child: Positioned(
                child: Stack(
                  children: <Widget>[
                    ClipOval(
                      child: Container(
                        //color: Color.fromARGB(180, 82, 84, 92),
                        width: 33,
                        height: 33,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(180, 82, 84, 92),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 3,
                              offset:
                                  Offset(5, 5), // changes position of shadow
                            ),
                          ],
                        ),
                        child: CircularProgressIndicator(
                          strokeWidth: 5,
                          value: score * 0.1,
                          //ler da api
                          backgroundColor: Colors.blueGrey[300],
                          valueColor: getScoreColor(score),
                          //AlwaysStoppedAnimation<Color>(Colors.pink[400]),
                        ),
                      ),
                    ),
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 8),
                      child: Text(
                        score.toDouble().toString(),
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
                  text: title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
            ),
            SizedBox(height: 5),
            Container(
                width: 130,
                child: Text(
                  subtitle,
                  style: TextStyle(fontSize: 15),
                )),
          ],
        ),
      ],
    );
  }
}

Animation<Color> getScoreColor(num score) {
  //score = 10;
  return AlwaysStoppedAnimation<Color>(
      HSVColor.fromAHSV(1, (score * 10.0) + 10, 1, 0.75).toColor());
}

class InformationMenuBox extends StatelessWidget {
  const InformationMenuBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Tuple2<IconData, String>>(
      icon: Icon(
        Icons.pending_sharp,
        color: Color.fromARGB(180, 138, 140, 146),
        size: 36,
      ),
      onSelected: choiceAction,
      color: Color.fromARGB(240,237,238,245),
      itemBuilder: (BuildContext context) {
        return Constants.choices.map((Tuple2<IconData, String> choice) {
          return PopupMenuItem<Tuple2<IconData, String>>(
              value: choice,
              child: Row(
                children: [
                  Icon(
                    choice.item1,
                    color: Colors.blueGrey,
                  ),
                  Text(choice.item2),
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
      Tuple2<IconData, String>(Icons.info, ' Informação');

  static const List<Tuple2<IconData, String>> choices =
      <Tuple2<IconData, String>>[
    FirstItem,
    SecondItem,
  ];
}

void choiceAction(Tuple2<IconData, String> choice) {
  if (choice == Constants.FirstItem) {
    print('Favorito');
  } else if (choice == Constants.SecondItem) {
    print('Informação');
  }
}
