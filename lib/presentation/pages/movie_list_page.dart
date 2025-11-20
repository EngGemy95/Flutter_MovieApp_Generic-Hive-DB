import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/bloc/movie/movie_event.dart';

import '../bloc/movie/movie_bloc.dart';
import '../bloc/movie/movie_state.dart';
import 'movie_form_page.dart';


class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) return const Center(child: CircularProgressIndicator());
          if (state is MovieLoaded) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, i) {
                final movie = state.movies[i];
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text(movie.description ?? ''),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => context.read<MovieBloc>().add(DeleteMovieEvent(movie.id!)),
                  ),
                );
              },
            );
          }
          return const Center(child: Text('No Movies'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MovieFormPage())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
