part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

final class LoginInitial extends LoginState {
  const LoginInitial();
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  const LoginLoadingState();

  @override
  List<Object> get props => [];
}

class LoginSuccessfulState extends LoginState {
  const LoginSuccessfulState();

  @override
  List<Object> get props => [];
}

class LoginFailedState extends LoginState {
  const LoginFailedState();

  @override
  List<Object> get props => [];
}
