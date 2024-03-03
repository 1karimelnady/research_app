abstract class MainStates {}

class InitialState extends MainStates {}

////////////////////////////////////// Create research form sates ///////////////////////////////////////////////////////
class CreateResearchLoadingState extends MainStates {}

class CreateResearchSuccessState extends MainStates {
  var response;
  CreateResearchSuccessState({this.response});
}

class CreateResearchErrorState extends MainStates {
  final String errormessage;
  CreateResearchErrorState(this.errormessage);
}

class HandState extends MainStates {}

class LanguageState extends MainStates {}

class VisionState extends MainStates {}

class HearingNormalAState extends MainStates {}

class OriginState extends MainStates {}

class ADHDState extends MainStates {}

class MusicalBackgroundState extends MainStates {}

/////////////////////////// Get  Researcher Researches States /////////////////////////////////////////////////////////////////////////

class GetResearchesLoadingState extends MainStates {}

class GetResearchesSuccessState extends MainStates {}

class GetResearchesErrorState extends MainStates {
  final String errorMessage;

  GetResearchesErrorState(this.errorMessage);
}

/////////////////////////// Get  Student Researches States /////////////////////////////////////////////////////////////////////////
class GetStudentResearchesLoadingState extends MainStates {}

class GetStudentResearchesSuccessState extends MainStates {}

class GetStudentResearchesErrorState extends MainStates {
  final String errorMessage;

  GetStudentResearchesErrorState(this.errorMessage);
}
///////////////////////////////// Register Research /////////////////////////////////////////////////////////////

class StudentRegisterResearchLoadingState extends MainStates {}

class StudentRegisterResearchSuccessState extends MainStates {}

class StudentRegisterResearchErrorState extends MainStates {
  final String errorMessage;

  StudentRegisterResearchErrorState(this.errorMessage);
}

////////////////////////////// change tabbar state /////////////////////////
class StudentChangeTabBarState extends MainStates {}

////////////////////////////////////// get student researchese based on status ////////////////////

class GetStudentResearchesStatusLoadingState extends MainStates {}

class GetStudentResearchesSuccessStatusState extends MainStates {}

class GetStudentResearchesErrorStatusState extends MainStates {
  final String errorMessage;

  GetStudentResearchesErrorStatusState(this.errorMessage);
}

///////////////////////////////////// Accept or Reject student Research ////////////////////////////////////
// class AcceptOrRefuseLoadingState extends MainStates {}

class AcceptLoadingState extends MainStates {}

class RefuseLoadingState extends MainStates {}

class AcceptSuccessStatusState extends MainStates {}

class AcceptErrorStatusState extends MainStates {
  final String errorMessage;

  AcceptErrorStatusState(this.errorMessage);
}

class RefusedSuccessStatusState extends MainStates {}

class RefusedErrorStatusState extends MainStates {
  final String errorMessage;

  RefusedErrorStatusState(this.errorMessage);
}

///////////////////////////////////////// notification //////////////////////////////

class NotificationLoading extends MainStates {}

class NotificationSuccess extends MainStates {}

class NotificationError extends MainStates {}

////////////////// get accepted student ///////////////////////////////////

class GetStudentAcceptLoadingState extends MainStates {}

class GetStudentAcceptedErrorState extends MainStates {}

class GetStudentAcceptSuccessState extends MainStates {}

/////////////////////////////////////// send notification ///////////////////////

class SendNotificationLoading extends MainStates {}

class SendNotificationSuccess extends MainStates {
  var response;
  SendNotificationSuccess({this.response});
}

class SendNotificationError extends MainStates {}

///////////////////////////////////////////////////   Get All Researcher              /////////////////////////////////

class GetAllResearcherLoading extends MainStates {}

class GetAllResearcherSuccess extends MainStates {}

class GetAllResearcherError extends MainStates {}

////////////////////////////////////////////////////// get researches of researchers //////////////////

class GetAllResearchesLoading extends MainStates {}

class GetAllResearchesSuccess extends MainStates {}

class GetAllResearchesError extends MainStates {}
