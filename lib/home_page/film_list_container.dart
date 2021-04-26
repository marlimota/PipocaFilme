import 'package:flutter/material.dart';
import 'film_information_box.dart';

class FilmListContainer extends StatelessWidget {
  FilmListContainer(this.filmDataList);

  //variavel lista do tipo FilmData
  final List<FilmData> filmDataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 270,
      padding: EdgeInsets.symmetric(horizontal: 7.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: getFilmInformationBoxList(filmDataList),
      ),
    );
  }
}

//objeto que possui 3 variaveis
class FilmData {
  FilmData(this.filmPoster, this.title, this.subtitle);

  final String filmPoster;
  final String title;
  final String subtitle;
}

List<Widget> getFilmInformationBoxList(List<FilmData> fDataList) {
  List<Widget> childs = [];
  for (var fdata in fDataList) {
    childs.add(
        new FilmInformationBox(fdata.filmPoster, fdata.title, fdata.subtitle));
  }
  return childs;
}
