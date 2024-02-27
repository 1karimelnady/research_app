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
