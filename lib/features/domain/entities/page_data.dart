//classe com informações da página de lista de filmes da api
import 'package:filmes_app/features/data/models/film_model.dart';

class PageData {
  int page;
  List<FilmModel> results;
  int totalPages;
  int totalResults;

  PageData({this.page, this.results, this.totalPages, this.totalResults});

  //Converte de Json para objeto (ou seja de texto para código)
  PageData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <FilmModel>[];
      json['results'].forEach((v) {
        results.add(new FilmModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  //converte de volta para o formato json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      //data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}


