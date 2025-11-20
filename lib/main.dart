
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movie_app/domain/usecases/movies/get_movies.dart';
import 'package:movie_app/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_app/presentation/bloc/movie/movie_event.dart';
import 'package:movie_app/presentation/pages/movie_list_page.dart';

import 'data/local_db/config/hive_manager.dart';
import 'data/local_db/movie_local_repository.dart';
import 'data/models/movie_model.dart';
import 'data/repositories_impl/movie_repository_impl.dart';
import 'domain/usecases/movies/add_movie.dart';
import 'domain/usecases/movies/delete_movie.dart';
import 'domain/usecases/movies/update_movie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveManager.init();
  Hive.registerAdapter(MovieModelAdapter());

  final movieRepo = MovieLocalRepository();
  final repository = MovieRepositoryImpl(movieRepo);

  runApp(MyApp(repo: repository));
}

class MyApp extends StatelessWidget {
  final MovieRepositoryImpl repo;
  const MyApp({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieBloc(
        getMovies: GetMoviesUseCase(repo),
        addMovie: AddMovieUseCase(repo),
        deleteMovie: DeleteMovieUseCase(repo),
        updateMovie: UpdateMovieUseCase(repo),
      )..add(LoadMoviesEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const MovieListPage(),
      ),
    );
  }
}
