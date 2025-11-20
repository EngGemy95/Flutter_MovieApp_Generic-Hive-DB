
import 'package:movie_app/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies();
  Future<void> addMovie(Movie movie);
  Future<void> updateMovie(Movie movie);
  Future<void> deleteMovie(int id);
}