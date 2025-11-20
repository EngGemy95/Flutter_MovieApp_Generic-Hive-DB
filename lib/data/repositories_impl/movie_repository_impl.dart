import 'package:movie_app/data/local_db/movie_local_repository.dart';
import 'package:movie_app/data/mappers/movie_mapper.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieLocalRepository movieLocalRepo;

  MovieRepositoryImpl(this.movieLocalRepo);

  @override
  Future<void> addMovie(Movie movie) async {
    await movieLocalRepo.addMovie(MovieMapper.fromEntity(movie));
  }

  @override
  Future<void> deleteMovie(int id) async {
    await movieLocalRepo.deleteItem(id.toString());
  }

  @override
  Future<List<Movie>> getMovies() async {
    final movieModels = await movieLocalRepo.getMovies();
    final movies = movieModels
        .map((model) => MovieMapper.toMovieEntity(model))
        .toList();
    return movies;
  }

  @override
  Future<void> updateMovie(Movie movie) async {
    await movieLocalRepo.addMovie(MovieMapper.fromEntity(movie));
  }
}
