import 'package:filmes_app/features/data/models/movie_data_model.dart';
import 'package:filmes_app/features/domain/entities/page_data.dart';

class PageDataModel extends PageData {
  PageDataModel({
    int page,
    List<MovieData> results,
    int totalPages,
    int totalResults,
  }) : super(
            page: page,
            results: results,
            totalPages: totalPages,
            totalResults: totalResults);

  factory PageDataModel.fromJson(Map<String, dynamic> json) {
    return PageDataModel(
      page: json['page'],
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
      results: json['results'] != null
          ? json['results']
              .map((value) => new MovieDataModel.fromJson(value))
              .toList()
          : null,
    );
  }

  //converte de volta para o formato json
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['page'] = this.page;
  //   if (this.results != null) {
  //     data['results'] = this.results.map((v) => v.toJson()).toList();
  //   }
  //   data['total_pages'] = this.totalPages;
  //   data['total_results'] = this.totalResults;
  //   return data;
  // }
}
