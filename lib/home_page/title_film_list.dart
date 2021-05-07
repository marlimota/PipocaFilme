import 'package:flutter/material.dart';

//titulo da lista de filme
class TitleFilmList extends StatelessWidget {
  TitleFilmList(this.text);

  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.0),
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.pink.shade700,
          ),
        ),
      ),
    );
  }
}
