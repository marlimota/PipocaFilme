import 'package:filmes_app/features/domain/entities/page_data.dart';
import 'package:flutter/material.dart';
import 'film_information_box.dart';

class FilmListContainer extends StatelessWidget {
  final List<FilmData> filmList;

  const FilmListContainer({Key key, this.filmList}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Container( 
      //width: 12,
      height: 280,
      //padding: EdgeInsets.symmetric(horizontal: 7.0),
      child: Container(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filmList.length,
            itemBuilder: (BuildContext context, int index) {
              return new FilmInformationBox(
                  filmList[index].posterPath,
                  filmList[index].title,
                  filmList[index].releaseDate,
                  filmList[index].voteAverage);
            }),
      ),
    );
  }
}

// class FilmListContainer extends StatefulWidget {
//   final String url;

//   FilmListContainer(this.url);

//   @override
//   _FilmListContainerLoadingState createState() =>
//       _FilmListContainerLoadingState(url);
// }

// class _FilmListContainerLoadingState extends State<FilmListContainer> {
//   List<FilmData> filmList = [];
//   final String url;

//   _FilmListContainerLoadingState(this.url);

//   // Future<List<FilmData>> getFilmsData() async {
//   //   try {
//   //     //cria a variavel response, faz a solicitação da url, recebe os dados e armazena na variavel response
//   //     final response = await http.get(Uri.parse(url));
//   //     //se o valor recebido da url solicitada tiver chegado corretamente (status code 200) da seguimento ao código, senão retorna erro
//   //     if (response.statusCode == 200) {
//   //       //converte de string (response.body) para json (atraves do jsonDecode), ou seja, mapa de strings e variaveis dinamicas(tipo um objeto sem metodo) e depois converte para o tipo Pagedata e armazena na variavel
//   //       var pageJson = jsonDecode(response.body);
//   //       PageData pageDataObject = PageData.fromJson(pageJson);

//   //       return pageDataObject.results; //vai ser armazenado na variavel map
//   //     } else {
//   //       print("Erro");
//   //       return null;
//   //     }
//   //   } catch (e) {
//   //     print(e);
//   //     return null;
//   //   }
//   // }

//   // @override
//   // //initState é uma função executada quando inicia o estado
//   // void initState() {
//   //   //o super diz que deve-se usar tudo da initState
//   //   super.initState();
//   //   //e após a initState, roda mais código
//   //   //após a codificação da função geteFilmsData, executa essa outra função que armazena o return da função geteFilmsData na variavel filmList
//   //   getFilmsData().then((map) {
//   //     //map é apenas uma variavel para armazenar e poder utilizar o retorno da função acima
//   //     filmList = map;
//   //     //teste
//   //     print(filmList.length.toString());
//   //     //atualiza o estado
//   //     setState(() {});
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     if (filmList.isEmpty) {
//       return Container(
//         width: 12,
//         height: 300,
//         padding: EdgeInsets.symmetric(horizontal: 7.0),
//         child: Container(
//           child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: filmList.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return new FilmInformationBox(
//                   'https://i.imgur.com/9WE0XtP.png',
//                   'Loading',
//                   'Loading',
//                   '42',
//                 );
//               }),
//         ),
//       );
//     } else {
//       return Container(
//         width: 12,
//         height: 300,
//         padding: EdgeInsets.symmetric(horizontal: 7.0),
//         child: Container(
//           child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: filmList.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return new FilmInformationBox(
//                     filmList[index].posterPath,
//                     filmList[index].title,
//                     filmList[index].releaseDate,
//                     filmList[index].voteAverage);
//               }),
//         ),
//       );
//     }
//   }
// }

//objeto que possui 3 variaveis
// class FilmData {
//   FilmData(this.filmPoster, this.title, this.subtitle);

//   final String filmPoster;
//   final String title;
//   final String subtitle;
// }

// List<Widget> getFilmInformationBoxList(List<FilmData> fDataList) {
//   List<Widget> childs = [];
//   for (var fdata in fDataList) {
//     childs.add(
//         new FilmInformationBox(fdata.filmPoster, fdata.title, fdata.subtitle));
//   }
//   return childs;
// }
