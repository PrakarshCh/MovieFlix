abstract class SignupState {
  const SignupState();
}

class SignupInitialState extends SignupState {}

class SignupLoadingState extends SignupState {}

class SignupSuccessState extends SignupState {}

class SignupError extends SignupState {
  SignupError(this.message);
  String? message;
}
