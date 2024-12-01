import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_blog/core/app_di.dart';
import 'package:flutter_bloc_blog/core/failure.dart';
import 'package:flutter_bloc_blog/features/auth/domain/entities/auth_entity.dart';
import 'package:flutter_bloc_blog/features/auth/domain/usecases/login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit((LoadingState()));
      print('LoginRequested');
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(event.email)) {
        emit(const LoginFailureState(failure: Failure(message: 'Invalid Email')));
        return;
      }
      if (event.password.length < 6) {
        emit(const LoginFailureState(failure: Failure(message: 'Password must be at least 6 characters')));
        return;
      }
      if (event.email.isEmpty || event.password.isEmpty) {
        emit(const LoginFailureState(failure: Failure(message: 'Email and Password must not be empty')));
        return;
      }

      final result = await locater<LoginUsecase>().call(AuthEntity(email: event.email, password: event.password));
      result.fold(
        (failure) => emit(LoginFailureState(failure: failure)),
        (success) => emit(LoginSuccessState()),
      );
    });
  }
}
