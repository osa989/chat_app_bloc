import 'package:bloc/bloc.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'wrong-password') {
        emit(LoginFailure(errMessage: "password is incorrect"));
      } else if (ex.code == 'user-not-found') {
        emit(LoginFailure(errMessage: "No user found for that email"));
      }
    } catch (e) {
      emit(LoginFailure(errMessage: "something went wrong"));
    }
  }
}
