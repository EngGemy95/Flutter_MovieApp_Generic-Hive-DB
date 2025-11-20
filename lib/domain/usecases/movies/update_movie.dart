import '../../entities/movie.dart';
import '../../repositories/movie_repository.dart';

class UpdateMovieUseCase {
  final MovieRepository repository;

  UpdateMovieUseCase(this.repository);

  Future<void> call(Movie movie) async => repository.updateMovie(movie);
}
