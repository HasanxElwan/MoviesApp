import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    // BLOC
    sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
    // USE CASES
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    // REPOSITORY
    sl.registerLazySingleton<BaseMovieRepository>(
        () => MovieRepository(baseMovieRemoteDataSource: sl()));
    // DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
