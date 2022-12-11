import 'package:bloc/bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_movies.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      emit(const MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
          (l) => emit(MoviesState(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(MoviesState(
                nowPlayingMovies: r,
                nowPlayingState: RequestState.loaded,
              )));
    });
    on<GetpPopularMoviesEvent>((event, emit) async {

    });
  }
}
