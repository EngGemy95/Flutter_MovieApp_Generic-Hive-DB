import 'package:movie_app/domain/entities/movie.dart';

import '../../repositories/movie_repository.dart';

class AddMovieUseCase {
  final MovieRepository movieRepository;

  AddMovieUseCase(this.movieRepository);

  Future<void> call(String title, String description) async {
    Movie movie = Movie(
      id: DateTime.now().microsecondsSinceEpoch,
      title: title,
      description: description,
    );
    await movieRepository.addMovie(movie);
  }
}
