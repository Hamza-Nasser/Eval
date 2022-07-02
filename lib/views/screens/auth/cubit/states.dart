abstract class AuthStates{}

class AuthInitialState extends AuthStates{}

class AuthLoginLoadingState extends AuthStates{}
class AuthLoginSuccessState extends AuthStates{
  final String? uId;
  AuthLoginSuccessState(this.uId);
}
class AuthLoginErrorState extends AuthStates{
  static String? errorMsg;
  
}

class AuthRegisterLoadingState extends AuthStates{}
class AuthRegisterSuccessState extends AuthStates{}
class AuthRegisterErrorState extends AuthStates{}

class AuthForgotPasswordLoadingState extends AuthStates{}
class AuthForgotPasswordSuccessState extends AuthStates{}
class AuthForgotPasswordErrorState extends AuthStates{}


class AuthUserCreateNewLoadingState extends AuthStates{}
class AuthUserCreateNewSuccessState extends AuthStates{}
class AuthUserCreateNewErrorState extends AuthStates{
  static String? errorMsg;
}