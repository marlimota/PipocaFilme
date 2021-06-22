import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../features/domain/entities/page_data.dart';

class FilmListTest extends StatefulWidget {
  @override
  _FilmListTestState createState() => _FilmListTestState();
}

class _FilmListTestState extends State<FilmListTest> {
  List<FilmData> filmList; //lista do tipo filmData
  // final Uri url1 = Uri.parse(
  //     'https://api.themoviedb.org/3/movie/popular?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1');
  final Uri url = Uri.parse(
      'https://api.themoviedb.org/3/movie/now_playing?api_key=aacc29faa6584fd592f31ad4e495babf&language=en-US&page=1');

  Future<List<FilmData>> getFilmsData() async {
    try {
      //cria a variavel response, faz a solicitação da url, recebe os dados e armazena na variavel response
      final response = await http.get(url);
      //se o valor recebido da url solicitada tiver chegado corretamente (status code 200) da seguimento ao código, senão retorna erro
      if (response.statusCode == 200) {
        //converte de string (response.body) para json (atraves do jsonDecode), ou seja, mapa de strings e variaveis dinamicas(tipo um objeto sem metodo) e depois converte para o tipo Pagedata e armazena na variavel
        var pageJson = jsonDecode(response.body);
        PageData pageDataObject = PageData.fromJson(pageJson);

        return pageDataObject.results;
      } else {
        print("Erro");
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  //subescreve a função initState
  @override
  void initState() {
    //o super diz que deve-se usar tudo da initState
    super.initState();
    //e após a initState, roda mais código
    //após a codificação da função geteFilmsData, executa essa outra função que armazena o return da função geteFilmsData na variavel filmList
    getFilmsData().then((map) {
      //map é apenas uma variavel para armazenar e poder utilizar o retorno da função acima
      filmList = map;
      print(filmList.length.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: filmList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                //width: 100,
                color: Colors.blueAccent[100],
                child: Text(filmList[index].title),
              ),
            );
          },
        ),
      ),
    );
  }
}
