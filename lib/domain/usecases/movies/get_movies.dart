
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class GetMoviesUseCase {

  final MovieRepository movieRepository;

  GetMoviesUseCase(this.movieRepository);

  Future<List<Movie>> call() async => movieRepository.getMovies();

}