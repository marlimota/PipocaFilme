import 'package:flutter/material.dart';

//coluna de cada filme
class FilmInformationBox extends StatelessWidget {
  FilmInformationBox(this.filmPoster, this.title, this.subtitle);

  final filmPoster;
  final title;
  final subtitle;

  @override
  Widget build(BuildContext context) {
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
              ),
            ),
            Container(
              width: 140,
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.pending_sharp,
                    color: Color.fromARGB(180, 217, 217, 221),
                  ),
                ),
              ),
            ),
            Container(
              height: 215,
              margin: EdgeInsets.symmetric(horizontal: 22.0),
              alignment: Alignment.bottomLeft,
              child: Positioned(
                child: Image.asset(
                  'assets/images/nota.png',
                  width: 30,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(6.0),
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(subtitle),
      ],
    );
  }
}
