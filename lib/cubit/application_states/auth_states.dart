class AuthStates {}

class AuthInitialState extends AuthStates {}

class SavedType extends AuthStates {}

class SavedGender extends AuthStates {}

//////////////////////// Register states //////////////////////////////
class RegisterLoading extends AuthStates {}

class RegisterSuccess extends AuthStates {
  var response;
  RegisterSuccess({this.response});
}

class RegisterError extends AuthStates {
  final String errormessage;
  RegisterError(this.errormessage);
}

//////////////////////// Login states //////////////////////////////
class LoginLoading extends AuthStates {}

class LoginSuccess extends AuthStates {
  var response;
  LoginSuccess({this.response});
}

class LoginError extends AuthStates {
  final String errormessage;
  LoginError(this.errormessage);
}

class ChangePasswordVisibilty extends AuthStates {}
