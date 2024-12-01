part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});
}

class LoginSuccess extends AuthEvent {}

class LoginFailure extends AuthEvent {}

class Loading extends AuthEvent {}
