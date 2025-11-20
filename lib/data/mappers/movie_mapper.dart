import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MovieMapper {
  static Movie toMovieEntity(MovieModel model) {
    return Movie(
      id: model.id,
      title: model.title,
      description: model.description,
    );
  }

  static MovieModel fromEntity(Movie entity) {
    return MovieModel(
      id: entity.id!,
      title: entity.title,
      description: entity.description,
    );
  }
}
