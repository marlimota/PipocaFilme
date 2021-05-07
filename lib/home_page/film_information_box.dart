import 'package:flutter/material.dart';

//coluna de cada filme
class FilmInformationBox extends StatelessWidget {
  FilmInformationBox(this.filmPoster, this.title, this.subtitle, this.score);

  final filmPoster;
  final title;
  final subtitle;
  final score;

  @override
  Widget build(BuildContext context) {
    Stack(
      children: [
        Container(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            value: 0.75,
            backgroundColor: Colors.blueAccent,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
          ),
        ),
        Center(
          child: Text(
            '75%',
            //style: AppTextStyles.heading,
          ),
        ),
      ],
    );
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
              height: 200,
              width: 130,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
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
              width: 140,
              height: 200,
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.pending_sharp,
                    color: Color.fromARGB(180, 138, 140, 146),
                    size: 30,
                  ),
                ),
              ),
            ),
            Container(
              height: 215,
              margin: EdgeInsets.symmetric(horizontal: 22.0),
              alignment: Alignment.bottomLeft,
              child: Positioned(
                child: Stack(
                  children: <Widget>[
                    ClipOval(
                      child: Container(
                        //color: Color.fromARGB(180, 82, 84, 92),
                        width: 32,
                        height: 32,
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
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.pink[400]),
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
        SizedBox(
          height: 10,
        ),
        //titulo e data dos filmes
        Column(
          children: [
            Container(
              width: 130,
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
                width: 130,
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
