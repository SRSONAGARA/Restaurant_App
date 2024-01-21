abstract class RegistrationState {}

class RegistrationInitialState extends RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class PswVisibilityChangeState extends RegistrationState {
  final bool isObscure;
  PswVisibilityChangeState({required this.isObscure});
}

class RegistrationSuccessState extends RegistrationState {
  final String msg ="Successful";
  RegistrationSuccessState({msg});
}

class RegistrationErrorState extends RegistrationState {
  final String msg;
  RegistrationErrorState({required this.msg});
}
class RegistrationFailedState extends RegistrationState {
  final String msg = "Something went wrong";
  RegistrationFailedState({msg});
}
