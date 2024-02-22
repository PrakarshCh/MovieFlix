abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginError extends LoginState {
  LoginError(this.message);
  String? message;
}
