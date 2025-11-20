import '../../repositories/movie_repository.dart';

class DeleteMovieUseCase {
  final MovieRepository repository;

  DeleteMovieUseCase(this.repository);

  Future<void> call(int id) async => repository.deleteMovie(id);
}
