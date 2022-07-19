import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:filmes_app/core/platform/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
//import 'features/data/datasources/films_local_data_source.dart';
import 'features/data/datasources/films_remote_data_source.dart';
import 'features/data/repositories/films_repository_impl.dart';
import 'features/domain/repositories/films_repository.dart';
import 'features/domain/usecases/get_popular_film_list.dart';
import 'features/domain/usecases/get_release_film_list.dart';
import 'features/presentation/bloc/bloc_popular/film_popular_bloc.dart';
import 'features/presentation/bloc/bloc_release/film_release_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - Number Trivia
//Bloc
  sl.registerFactory(
    () => FilmPopularBloc(
      getPopularFilmList: sl(),
    ),
  );
  sl.registerFactory(
    () => FilmReleaseBloc(
      getReleaseFilmList: sl(),
    ),
  );
// Use cases
  sl.registerLazySingleton(() => GetPopularMovieListUsecase(sl()));
  sl.registerLazySingleton(() => GetReleaseMovieListUsecase(sl()));
// Repository
  sl.registerLazySingleton<MovieRepository>(
    () => FilmsRepositoryImpl(
      remoteDataSource: sl(),
      //localDataSource: sl(),
      networkInfo: sl(),
    ),
  );
// Data sources
  sl.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(client: sl()),
  );
  // sl.registerLazySingleton<FilmLocalDataSource>(
  //   () => FilmLocalDataSourceImpl(sharedPreferences: sl()),
  // );
//! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
