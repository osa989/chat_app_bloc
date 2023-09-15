import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(RegisterFailure(errMessage: "weak password"));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errMessage: "email already exist"));
      }
    } catch (e) {
      emit(RegisterFailure(errMessage: "something went wrong"));
    }
  }

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

  @override
  void onChange(Change<AuthState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
