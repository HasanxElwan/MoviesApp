import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';

import '../../../core/error/failure.dart';

abstract class BaseMovieRepository {
  Future<Either<Faliure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Faliure, List<Movie>>> getPopularMovies();
  Future<Either<Faliure, List<Movie>>> getTopRatedMovies();
}
