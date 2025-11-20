import 'package:movie_app/domain/entities/movie.dart';

abstract class MovieEvent {}

class LoadMoviesEvent extends MovieEvent {}

class AddMoviesEvent extends MovieEvent {
  final String title;
  final String description;

  AddMoviesEvent(this.title, this.description);
}

class DeleteMovieEvent extends MovieEvent {
  final int id;

  DeleteMovieEvent(this.id);
}

class UpdateMoviesEvent extends MovieEvent {
  final Movie movie;

  UpdateMoviesEvent(this.movie);
}
