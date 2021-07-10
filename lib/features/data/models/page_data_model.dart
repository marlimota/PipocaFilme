// import 'dart:convert';

// import 'package:filmes_app/features/data/models/film_model.dart';
// import 'package:filmes_app/features/domain/entities/page_data.dart';

// class PageDataModel extends PageData{

//   PageDataModel({int page, List<FilmModel> results, int totalPages, int totalResults}): super (page: page, results: results, totalPages: totalPages, totalResults: totalResults);

//   //Converte de Json para objeto (ou seja de texto para código)
//   factory PageDataModel.fromJson(Map<String, dynamic> json) {
//     return PageDataModel(
//       page: json['page'],
//       results: ,
//       totalPages: json['total_pages'],
//       totalResults: json['total_results'],
//     );
//   }

//   //converte de volta para o formato json
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['page'] = this.page;
//     if (this.results != null) {
//       //data['results'] = this.results.map((v) => v.toJson()).toList();
//     }
//     data['total_pages'] = this.totalPages;
//     data['total_results'] = this.totalResults;
//     return data;
//   }
// }

// Function getFilmModelList(){
//          results = <FilmModel>[];
//         json['results'].forEach((v) {
//           results.add(new FilmModel.fromJson(v));
//         });
//         return results;
// }