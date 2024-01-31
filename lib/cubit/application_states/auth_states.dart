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

enum UserType { student, professor, researcher }

class ChangeStudentType extends AuthStates {
  String userType;
  ChangeStudentType(this.userType);
}

class ChangeProfessorType extends AuthStates {
  String userType;
  ChangeProfessorType(this.userType);
}

class ChangeResearcherType extends AuthStates {
  String userType;
  ChangeResearcherType(this.userType);
}

class LoginSuccess extends AuthStates {
  var response;
  LoginSuccess({this.response});
}

class LoginError extends AuthStates {
  final String errormessage;
  LoginError(this.errormessage);
}

class ChangePasswordVisibilty extends AuthStates {}
