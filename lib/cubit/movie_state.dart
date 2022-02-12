part of 'movie_cubit.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoadedSucces extends MovieState {
  final List<Movie> movies;

  const MovieLoadedSucces(this.movies);
  @override
  List<Object> get props => [movies];
}

class MovieLoadingFail extends MovieState {
  final String message;

  const MovieLoadingFail(this.message);

  @override
  List<Object> get props => [message];
}
