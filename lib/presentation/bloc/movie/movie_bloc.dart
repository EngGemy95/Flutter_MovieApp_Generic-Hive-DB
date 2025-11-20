import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/usecases/movies/add_movie.dart';
import 'package:movie_app/domain/usecases/movies/delete_movie.dart';
import 'package:movie_app/domain/usecases/movies/get_movies.dart';
import 'package:movie_app/domain/usecases/movies/update_movie.dart';
import 'package:movie_app/presentation/bloc/movie/movie_event.dart';
import 'package:movie_app/presentation/bloc/movie/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final AddMovieUseCase addMovie;
  final GetMoviesUseCase getMovies;
  final UpdateMovieUseCase updateMovie;
  final DeleteMovieUseCase deleteMovie;

  MovieBloc({
    required this.addMovie,
    required this.getMovies,
    required this.updateMovie,
    required this.deleteMovie,
  }) : super(MovieInitial()) {
    on<LoadMoviesEvent>(_loadMovies);
    on<AddMoviesEvent>(_addMovie);
    on<UpdateMoviesEvent>(_updateMovie);
    on<DeleteMovieEvent>(_deleteMovie);
  }

  Future<void> _loadMovies(LoadMoviesEvent e, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final movies = await getMovies();
      emit(MovieLoaded(movies));
    } catch (error) {
      emit(MovieError(error.toString()));
    }
  }

  Future<void> _addMovie(AddMoviesEvent e, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      await addMovie(e.title, e.description);
      final movies = await getMovies();
      emit(MovieLoaded(movies));
    } catch (error) {
      emit(MovieError(error.toString()));
    }
  }

  Future<void> _updateMovie(
    UpdateMoviesEvent e,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());
    try {
      await updateMovie(e.movie);
      final movies = await getMovies();
      emit(MovieLoaded(movies));
    } catch (error) {
      emit(MovieError(error.toString()));
    }
  }

  Future<void> _deleteMovie(
    DeleteMovieEvent e,
    Emitter<MovieState> emit,
  ) async {
    await deleteMovie(e.id);
    final movies = await getMovies();
    emit(MovieLoaded(movies));
  }
}
