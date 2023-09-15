import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoading());

        try {
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email, password: event.password);
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
    });
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {

    super.onTransition(transition);
    print(transition);
  }
}
