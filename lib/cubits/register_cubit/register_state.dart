part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {}

final class RegisterFailure extends RegisterState {
final  String errMessage;
  RegisterFailure({required this.errMessage});
}
