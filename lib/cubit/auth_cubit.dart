import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tix_movie/model/model.dart';
import 'package:tix_movie/services/services.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // Sign In
  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signIn(
        email: email,
        password: password,
      );
      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signUp({
    required String email,
    required String password,
    required String name,
    List<String> selectedGenres = const [],
    String selectedLanguage = '',
  }) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService().signUp(
        email: email,
        password: password,
        name: name,
        selectedGenres: selectedGenres,
        selectedLanguage: selectedLanguage,
      );

      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(
        AuthFailed(
          e.toString(),
        ),
      );
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUser(id);
      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void topUp(user, int amount) async {
    try {
      // emit(AuthSucces(user));
      if (state is AuthSucces) {
        UserModel updateUser = (state as AuthSucces)
            .user
            .copyWith(balance: (state as AuthSucces).user.balance + amount);
        await UserService().setUser(updateUser);
        emit(AuthSucces(updateUser));
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void purchase(int amount) async {
    try {
      // emit(AuthSucces(user));
      if (state is AuthSucces) {
        UserModel updateUser = (state as AuthSucces)
            .user
            .copyWith(balance: (state as AuthSucces).user.balance - amount);
        await UserService().setUser(updateUser);
        emit(AuthSucces(updateUser));
      }
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
