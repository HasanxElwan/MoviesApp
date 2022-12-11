import 'package:movies_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.voteAverage,
    required super.backdropPath,
    required super.releaseDate,
    required super.genreIds,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        backdropPath: json['backdrop_path'],
        releaseDate: json['release_date'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
      );
}
