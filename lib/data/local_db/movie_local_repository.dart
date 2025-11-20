
import 'package:movie_app/core/constants/hive_boxes_name.dart';
import 'package:movie_app/data/local_db/config/base_local_repository.dart';
import 'package:movie_app/data/models/movie_model.dart';

class MovieLocalRepository extends BaseLocalRepository<MovieModel> {
  MovieLocalRepository() : super(MOVIE_BOX_NAME);

  Future<void> addMovie(MovieModel movieModel) async {
    await addItem(movieModel.id.toString(), movieModel);
  }

  Future<List<MovieModel>> getMovies() async {
    return await getAll();
  }

  Future<void> deleteMovie(int id) async{
    await deleteItem(id.toString());
  }
}