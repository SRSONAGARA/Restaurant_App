abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final String msg;
  LoginSuccessState({required this.msg});
}

class LoginErrorState extends LoginState {
  final String msg;
  LoginErrorState({required this.msg});
}

class LoginFailedState extends LoginState {
  final String msg = "Something went wrong";
  LoginFailedState({msg});
}

class LoginCredInvalidState extends LoginState {
  final String msg;
  LoginCredInvalidState({required this.msg});
}
