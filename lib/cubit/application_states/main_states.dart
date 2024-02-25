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

/////////////////////////// Get Researches States /////////////////////////////////////////////////////////////////////////

class GetResearchesLoadingState extends MainStates {}

class GetResearchesSuccessState extends MainStates {}

class GetResearchesErrorState extends MainStates {
  final String errorMessage;

  GetResearchesErrorState(this.errorMessage);
}
