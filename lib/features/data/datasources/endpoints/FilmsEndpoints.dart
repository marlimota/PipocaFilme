class FilmEndpoints {
  static String linkApiPopular(String apiKey) => "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1";
  static String linkApiRelease(String apiKey) => "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US&page=1";
}