import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tix_movie/model/model.dart';
import 'package:tix_movie/services/services.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit() : super(MovieInitial());

  void getMovie() async {
    try {
      emit(MovieLoading());
      List<Movie> movie = await MovieServices.getMovies(2);
      emit(MovieLoadedSucces(movie));
    } catch (e) {
      emit(MovieLoadingFail(e.toString()));
    }
  }
}
