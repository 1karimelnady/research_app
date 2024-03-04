import 'dart:core';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/utilities/cache_helper.dart';

import '../model/accepted_student_researcher_model.dart';
import '../model/all_researcher_model.dart';
import '../model/notfication_model.dart';
import '../model/researches_model.dart';
import '../model/researches_of_researcher_model.dart';
import '../model/researches_student_status_model.dart';
import '../model/student_researches_model.dart';
import 'application_states/main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialState());
  Dio dio = Dio();

  static MainCubit get(context) => BlocProvider.of(context);

  //////////////////////////////////////// create research *********************************************************

  List<String> languageArray = [];
  List<String> visionArray = [];
  List<String> hearingArray = [];
  List<String> originArray = [];
  List<String> ADHDArray = [];
  List<String> musicalBackgroundArray = [];
  List<String> handArray = [];

  List<Map<String, dynamic>> firstKeys = [];

  bool isFirstQuestionChecked = false;
  bool isSecondQuestionChecked = false;
  bool isThirdQuestionChecked = false;

  void onFirstChanged(int index, String answer) {
    String key = "hand[$index]";
    if (answer == 'notRelevant') {
      isFirstQuestionChecked = answer == 'left';
      isSecondQuestionChecked = answer == 'right';
      isThirdQuestionChecked = answer == 'notRelevant';
      if (isThirdQuestionChecked) {
        handArray = ['notRelevant'];
        firstKeys = [
          {key: answer}
        ];
      } else {
        handArray = [];
        firstKeys = [];
      }
    } else {
      if (isThirdQuestionChecked) {
        isThirdQuestionChecked = false;
        handArray.remove('notRelevant');
        firstKeys.removeWhere((element) => element[key] == "notRelevant");
      }

      if (!handArray.contains(answer)) {
        handArray.add(answer);
        firstKeys.add({key: answer});
      } else {
        handArray.remove(answer);
        firstKeys.removeWhere((element) => element[key] == answer);
      }
      isFirstQuestionChecked = handArray.contains('left');
      isSecondQuestionChecked = handArray.contains('right');
    }
    print("firstkeys : $firstKeys ");
    print(handArray);
    emit(HandState());
  }

  List<Map<String, dynamic>> secondKeys = [];

  bool isFirstSecondQuestionChecked = false;
  bool isSecondSecondQuestionChecked = false;
  bool isThirdSecondQuestionChecked = false;
  bool isFourthSecondQuestionChecked = false;

  void onSecondChanged(int index, String answer) {
    String key = "language[$index]";

    int keyIndex =
        secondKeys.indexWhere((element) => element.keys.first == key);

    if (answer == 'notRelevant') {
      isFirstSecondQuestionChecked = answer == 'english';
      isSecondSecondQuestionChecked = answer == 'hebrew';
      isThirdSecondQuestionChecked = answer == 'arabic';
      isFourthSecondQuestionChecked = answer == 'notRelevant';

      if (isFourthSecondQuestionChecked) {
        languageArray = ['notRelevant'];
        secondKeys = [
          {key: answer}
        ];
      } else {
        languageArray = [];
        secondKeys = [];
      }
    } else {
      if (isFourthSecondQuestionChecked) {
        isFourthSecondQuestionChecked = false;
        languageArray.remove('notRelevant');
        secondKeys.removeWhere((element) => element[key] == "notRelevant");
      }

      if (!languageArray.contains(answer)) {
        languageArray.add(answer);
        secondKeys.add({key: answer});
      } else {
        languageArray.remove(answer);
        secondKeys.removeWhere((element) => element[key] == answer);
      }

      isFirstSecondQuestionChecked = languageArray.contains('english');
      isSecondSecondQuestionChecked = languageArray.contains('hebrew');
      isThirdSecondQuestionChecked = languageArray.contains('arabic');
    }

    emit(LanguageState());
  }

  List<Map<String, dynamic>> thirdKeys = [];

  bool isFirstThirdQuestionChecked = false;
  bool isSecondThirdQuestionChecked = false;
  bool isThirdThirdQuestionChecked = false;

  void onThirdChanged(int index, String answer) {
    String key = "vision[$index]";

    int keyIndex = thirdKeys.indexWhere((element) => element.keys.first == key);

    if (answer == 'notRelevant') {
      isFirstThirdQuestionChecked = answer == 'normal';
      isSecondThirdQuestionChecked = answer == 'notNormal';
      isThirdThirdQuestionChecked = answer == 'notRelevant';

      if (isThirdThirdQuestionChecked) {
        visionArray = ['notRelevant'];
        thirdKeys = [
          {key: answer}
        ];
      } else {
        visionArray = [];
        thirdKeys = [];
      }
    } else {
      if (isThirdThirdQuestionChecked) {
        isThirdThirdQuestionChecked = false;
        visionArray.remove('notRelevant');
        thirdKeys.removeWhere((element) => element[key] == "notRelevant");
      }

      if (!visionArray.contains(answer)) {
        visionArray.add(answer);
        thirdKeys.add({key: answer});
      } else {
        visionArray.remove(answer);
        thirdKeys.removeWhere((element) => element[key] == answer);
      }

      isFirstThirdQuestionChecked = visionArray.contains('normal');
      isSecondThirdQuestionChecked = visionArray.contains('notNormal');
    }

    emit(VisionState());
  }

  List<Map<String, dynamic>> fourthKeys = [];

  bool isFirstFourthQuestionChecked = false;
  bool isSecondFourthQuestionChecked = false;
  bool isThirdFourthQuestionChecked = false;

  void onFourthChanged(int index, String answer) {
    String key = "hearingNormal[$index]";

    int keyIndex =
        fourthKeys.indexWhere((element) => element.keys.first == key);

    if (answer == 'notRelevant') {
      isFirstFourthQuestionChecked = answer == 'yes';
      isSecondFourthQuestionChecked = answer == 'no';
      isThirdFourthQuestionChecked = answer == 'notRelevant';

      if (isThirdFourthQuestionChecked) {
        hearingArray = ['notRelevant'];
        fourthKeys = [
          {key: answer}
        ];
      } else {
        hearingArray = [];
        fourthKeys = [];
      }
    } else {
      if (isThirdFourthQuestionChecked) {
        isThirdFourthQuestionChecked = false;
        hearingArray.remove('notRelevant');
        fourthKeys.removeWhere((element) => element[key] == "notRelevant");
      }

      if (!hearingArray.contains(answer)) {
        hearingArray.add(answer);
        fourthKeys.add({key: answer});
      } else {
        hearingArray.remove(answer);
        fourthKeys.removeWhere((element) => element[key] == answer);
      }

      isFirstFourthQuestionChecked = hearingArray.contains('yes');
      isSecondFourthQuestionChecked = hearingArray.contains('no');
    }

    emit(HearingNormalAState());
  }

  List<Map<String, dynamic>> fifthKeys = [];

  bool isFirstFifthQuestionChecked = false;
  bool isSecondFifthQuestionChecked = false;
  bool isThirdFifthQuestionChecked = false;

  void onFifthChanged(int index, String answer) {
    String key = "origin[$index]";

    int keyIndex = fifthKeys.indexWhere((element) => element.keys.first == key);

    if (answer == 'notRelevant') {
      isFirstFifthQuestionChecked = answer == 'usa';
      isSecondFifthQuestionChecked = answer == 'israel';
      isThirdFifthQuestionChecked = answer == 'notRelevant';

      if (isThirdFifthQuestionChecked) {
        originArray = ['notRelevant'];
        fifthKeys = [
          {key: answer}
        ];
      } else {
        originArray = [];
        fifthKeys = [];
      }
    } else {
      if (isThirdFifthQuestionChecked) {
        isThirdFifthQuestionChecked = false;
        originArray.remove('notRelevant');
        fifthKeys.removeWhere((element) => element[key] == "notRelevant");
      }

      if (!originArray.contains(answer)) {
        originArray.add(answer);
        fifthKeys.add({key: answer});
      } else {
        originArray.remove(answer);
        fifthKeys.removeWhere((element) => element[key] == answer);
      }

      isFirstFifthQuestionChecked = originArray.contains('usa');
      isSecondFifthQuestionChecked = originArray.contains('israel');
    }

    emit(OriginState());
  }

  List<Map<String, dynamic>> sixthKeys = [];

  bool isFirstSixthQuestionChecked = false;
  bool isSecondSixthQuestionChecked = false;
  bool isThirdSixthQuestionChecked = false;

  void onSixthChanged(int index, String answer) {
    String key = "ADHD[$index]";

    int keyIndex = sixthKeys.indexWhere((element) => element.keys.first == key);

    if (answer == 'notRelevant') {
      isFirstSixthQuestionChecked = answer == 'yes';
      isSecondSixthQuestionChecked = answer == 'no';
      isThirdSixthQuestionChecked = answer == 'notRelevant';

      if (isThirdSixthQuestionChecked) {
        ADHDArray = ['notRelevant'];
        sixthKeys = [
          {key: answer}
        ];
      } else {
        ADHDArray = [];
        sixthKeys = [];
      }
    } else {
      if (isThirdSixthQuestionChecked) {
        isThirdSixthQuestionChecked = false;
        ADHDArray.remove('notRelevant');
        sixthKeys.removeWhere((element) => element[key] == "notRelevant");
      }

      if (!ADHDArray.contains(answer)) {
        ADHDArray.add(answer);
        sixthKeys.add({key: answer});
      } else {
        ADHDArray.remove(answer);
        sixthKeys.removeWhere((element) => element[key] == answer);
      }

      isFirstSixthQuestionChecked = ADHDArray.contains('yes');
      isSecondSixthQuestionChecked = ADHDArray.contains('no');
    }

    emit(ADHDState());
  }

  List<Map<String, dynamic>> seventhKeys = [];

  bool isFirstSeventhQuestionChecked = false;
  bool isSecondSeventhQuestionChecked = false;
  bool isThirdSeventhQuestionChecked = false;

  void onSeventhChanged(int index, String answer) {
    String key = "musicalBackground[$index]";

    int keyIndex =
        seventhKeys.indexWhere((element) => element.keys.first == key);

    if (answer == 'notRelevant') {
      isFirstSeventhQuestionChecked = answer == 'yes';
      isSecondSeventhQuestionChecked = answer == 'no';
      isThirdSeventhQuestionChecked = answer == 'notRelevant';

      if (isThirdSeventhQuestionChecked) {
        musicalBackgroundArray = ['notRelevant'];
        seventhKeys = [
          {key: answer}
        ];
      } else {
        musicalBackgroundArray = [];
        seventhKeys = [];
      }
    } else {
      if (isThirdSeventhQuestionChecked) {
        isThirdSeventhQuestionChecked = false;
        musicalBackgroundArray.remove('notRelevant');
        seventhKeys.removeWhere((element) => element[key] == "notRelevant");
      }

      if (!musicalBackgroundArray.contains(answer)) {
        musicalBackgroundArray.add(answer);
        seventhKeys.add({key: answer});
      } else {
        musicalBackgroundArray.remove(answer);
        seventhKeys.removeWhere((element) => element[key] == answer);
      }

      isFirstSeventhQuestionChecked = musicalBackgroundArray.contains('yes');
      isSecondSeventhQuestionChecked = musicalBackgroundArray.contains('no');
    }

    emit(MusicalBackgroundState());
  }

  Future<void> createResearch({
    required String researchQuestion,
    required String credits,
    required String approvment,
    required String description,
  }) async {
    Map<String, dynamic> params = {
      "researchQuestion": researchQuestion,
      "Credits": credits,
      "approvment": approvment.toString(),
      "hand": handArray,
      "language": languageArray,
      "vision": visionArray,
      "hearingNormal": hearingArray,
      "origin": originArray,
      "ADHD": ADHDArray,
      "description": description,
      "musicalBackground": musicalBackgroundArray,
    };
    print("handArray: $handArray");
    print("languageArray: $languageArray");
    print("visionArray: $visionArray");
    print("hearingArray: $hearingArray");
    print("originArray: $originArray");
    print("ADHDArray: $ADHDArray");
    print("musicalBackgroundArray: $musicalBackgroundArray");

    try {
      emit(CreateResearchLoadingState());
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: 'token')}"
      };
      var response = await dio.post(baseUrl + "/researchers/research/create",
          data: params);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        emit(CreateResearchSuccessState(response: response.data));
      }
    } on DioException catch (e) {
      String errorMessage = "";

      if (e.response != null) {
        errorMessage = e.response!.data['message'] ?? 'An error occurred.';
      } else {
        errorMessage = 'An error occurred.';
      }

      emit(CreateResearchErrorState(errorMessage));
    } catch (e) {
      emit(CreateResearchErrorState('An error occurred.'));
    }
  }

///////////////////////////////////////////  get researcher researches     ///////////////////////////////////////////////////////

  List<Researches> researchesList = [];

  Future<void> getResearcherResearches() async {
    researchesList.clear();
    emit(GetResearchesLoadingState());

    try {
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: 'token')}"
      };

      Response response =
          await dio.get(baseUrl + "/researchers/user/researchs");

      if (response.statusCode == 201) {
        List<dynamic> data = response.data['researches'];

        researchesList = data.map((json) => Researches.fromJson(json)).toList();
        print("researchesList  : ${researchesList.length}");

        emit(GetResearchesSuccessState());
      }
    } on DioException catch (e) {
      String errorMessage = "";
      if (e.response != null) {
        errorMessage = e.response?.data['message'] ?? '';
        print(errorMessage.toString());
      }
      emit(GetResearchesErrorState(errorMessage.toString()));
    } on Exception catch (e) {
      emit(GetResearchesErrorState(e.toString()));
      print(e.toString());
    }
  }

//////////////////////////////////////////////////////// get student researches ////////////////////////////////////////////

  List<StudentResearchesModel> studentResearchesList = [];

  Future<void> getStudentResearches() async {
    studentResearchesList.clear();
    emit(GetStudentResearchesLoadingState());
    try {
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: "token")}"
      };

      var response = await dio.get(baseUrl + "/researchers/researchs/filter");
      if (response.statusCode == 200) {
        (response.data as List).forEach((element) {
          studentResearchesList.add(StudentResearchesModel.fromJson(element));
        });
        print(" studentResearchesList :  ${studentResearchesList.length}");
        if (studentResearchesList.isNotEmpty) {
          for (int i = 0; i < studentResearchesList.length; i++) {
            CacheHelper.setData(
                key: "_id", value: studentResearchesList[i].sId);
          }
        }
        emit(GetStudentResearchesSuccessState());
      }
    } on DioException catch (e) {
      String errorMessage = "";
      if (e.response != null) {
        errorMessage = e.response?.data['message'] ?? '';
        print(errorMessage.toString());
      }
      emit(GetStudentResearchesErrorState(errorMessage.toString()));
    } on Exception catch (e) {
      emit(GetStudentResearchesErrorState(e.toString()));
      print(e.toString());
    }
  }

///////////////////////////////////////////////////// registration research ///////////////////////////

  Future<void> registerResearch() async {
    print("${CacheHelper.getData(key: "_id")}");
    try {
      emit(StudentRegisterResearchLoadingState());
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: "token")}"
      };

      var response = await dio.put(baseUrl + "/students/research/register",
          data: {"research": "${CacheHelper.getData(key: "_id")}"});
      print("${CacheHelper.getData(key: "_id")}");
      if (response.statusCode == 200) {
        print(" ${CacheHelper.getData(key: "_id")}");
        emit(StudentRegisterResearchSuccessState());
      }
    } on DioException catch (e) {
      String errorMessage = "";
      if (e.response != null) {
        errorMessage = e.response?.data['message'] ?? '';
        print(errorMessage.toString());
      }
      emit(StudentRegisterResearchErrorState(errorMessage.toString()));
    } on Exception catch (e) {
      emit(StudentRegisterResearchErrorState(e.toString()));
      print(e.toString());
    }
  }

  /////////////////////////////////// StudentChangeTabBarState ///////////////////

  void changeTabBar(int index) {
    index = index;
    emit(StudentChangeTabBarState());
  }

  ///////////////////////////////////////////// get student researches status /////////////////////

  List<ResearchesStatus> studentResearchesStatusPendingList = [];
  List<ResearchesStatus> studentResearchesStatusAcceptList = [];
  List<ResearchesStatus> studentResearchesStatusRefusedList = [];

  Future<void> getStudentResearchesStatus({required String status}) async {
    try {
      emit(GetStudentResearchesStatusLoadingState());
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: "token")}"
      };

      var response = await dio
          .get(baseUrl + "/students/student/researches?status=$status");

      if (response.statusCode == 201) {
        List<dynamic> data = response.data['researches'];
        if (status == "pending") {
          studentResearchesStatusPendingList.clear();
        } else if (status == "accepted") {
          studentResearchesStatusAcceptList.clear();
        } else if (status == "rejected") {
          studentResearchesStatusRefusedList.clear();
        }
        for (int i = 0; i < data.length; i++) {
          List<dynamic> studentsStatus = data[i]['studentsStatus'];

          for (int j = 0; j < studentsStatus.length; j++) {
            String studentStatus = studentsStatus[j]['status'];

            ResearchesStatus researchStatus =
                ResearchesStatus.fromJson(data[i]);

            if (studentStatus == "pending") {
              studentResearchesStatusPendingList.add(researchStatus);
            } else if (studentStatus == "accepted") {
              studentResearchesStatusAcceptList.add(researchStatus);
            } else if (studentStatus == "rejected") {
              studentResearchesStatusRefusedList.add(researchStatus);
            }
          }
        }
        emit(GetStudentResearchesSuccessStatusState());
      }
    } on DioException catch (e) {
      String errorMessage = "";
      if (e.response != null) {
        errorMessage = e.response?.data['message'] ?? '';
        print(errorMessage.toString());
      }
      emit(GetStudentResearchesErrorStatusState(errorMessage.toString()));
    } on Exception catch (e) {
      emit(GetStudentResearchesErrorStatusState(e.toString()));
      print(e.toString());
    }
  }

///////////////////////////////////// Accept or Reject student Research/////////////////////////////////////

  Future<void> AcceptOrRefuse(
      {required String status,
      required String id,
      required String student}) async {
    try {
      if (status == "accepted") {
        emit(AcceptLoadingState());
      } else if (status == "rejected") {
        emit(RefuseLoadingState());
      }
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: "token")}"
      };

      var response = await dio
          .put(baseUrl + "/researchers/research/student/status", data: {
        "research": "$id",
        "student": "$student",
        "status": "$status"
      });
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (status == "accepted") {
          emit(AcceptSuccessStatusState());
        } else if (status == "rejected") {
          emit(RefusedSuccessStatusState());
        }
      }
    } on DioException catch (e) {
      String errorMessage = "";
      if (e.response!.data != null) {
        print(errorMessage.toString());
      }
      if (status == "accepted") {
        emit(AcceptErrorStatusState(errorMessage.toString()));
      } else if (status == "rejected") {
        emit(RefusedErrorStatusState(errorMessage.toString()));
      }
    } on Exception catch (e) {
      if (status == "accepted") {
        emit(AcceptErrorStatusState(e.toString()));
      } else if (status == "rejected") {
        emit(RefusedErrorStatusState(e.toString()));
      }
      print(e.toString());
    }
  }

  //////////////////////////////////////////////////////////////////////////// get Notification ////////////////////////

  List<NotificationModel> notificationList = [];

  Future<void> getNotification() async {
    notificationList.clear();
    emit(NotificationLoading());
    dio.options.headers = {
      "Authorization": "Bearer ${CacheHelper.getData(key: "token")}"
    };
    try {
      var response = await dio.get(
        baseUrl + "/users/notifications",
      );

      if (response.statusCode == 200) {
        (response.data as List).forEach((element) {
          notificationList.add(NotificationModel.fromJson(element));
        });

        print("notificationList : ${notificationList.length}");
        emit(NotificationSuccess());
      }
    } on DioException catch (e) {
      String errorMessage = "";
      if (e.response != null) {
        errorMessage = e.response?.data['message'] ?? '';
        print(errorMessage.toString());
      }
      emit(NotificationError());
    } on Exception catch (e) {
      emit(NotificationError());
      print(e.toString());
    }
  }

  //////////////////////////////////////////////////////////////////////////// get accepted student /////////////////////

  List<ResearchesAccepted> acceptedStudentList = [];

  Future<void> getAcceptedStudentResearcher() async {
    acceptedStudentList.clear();
    emit(GetStudentAcceptLoadingState());
    try {
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: "token")}"
      };

      var response = await dio.get(baseUrl + "/researchers/students/accepted");
      if (response.statusCode == 201) {
        List<dynamic> data = response.data['researches'];

        acceptedStudentList =
            data.map((json) => ResearchesAccepted.fromJson(json)).toList();
        print("acceptedStudentList  : ${acceptedStudentList.length}");
        emit(GetStudentAcceptSuccessState());
      }
    } on DioException catch (e) {
      String errorMessage = "";
      if (e.response != null) {
        errorMessage = e.response?.data['message'] ?? '';
        print(errorMessage.toString());
      }
      emit(GetStudentAcceptedErrorState());
    } on Exception catch (e) {
      emit(GetStudentAcceptedErrorState());
      print(e.toString());
    }
  }

/////////////////////////////////////////////////////// send notification /////////////////////////

  Future<void> sendNotification({
    required String title,
    required String body,
    required String id,
    required String user_id,
  }) async {
    Map<String, dynamic> params = {
      "research": id,
      "title": title,
      "body": body,
      "user": user_id,
    };
    try {
      emit(SendNotificationLoading());
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: 'token')}"
      };
      var response = await dio.post(baseUrl + "/messages/user", data: params);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        emit(SendNotificationSuccess(response: response.data));
      }
    } on DioException catch (e) {
      String errorMessage = "";

      if (e.response != null) {
        errorMessage = e.response!.data['message'] ?? 'An error occurred.';
      } else {
        errorMessage = 'An error occurred.';
      }

      emit(SendNotificationError());
    } catch (e) {
      emit(SendNotificationError());
    }
  }

/////////////////////////////////////////////////// Get aLL RESEARCHER /////////////////////////////////////

  List<Researchers> getAllResearcherList = [];

  Future<void> getAllreseracher() async {
    getAllResearcherList.clear();
    emit(GetAllResearcherLoading());
    try {
      var response = await dio.get(baseUrl + "/users/researchers");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['researchers'];

        getAllResearcherList =
            data.map((json) => Researchers.fromJson(json)).toList();
        print("researchesList  : ${getAllResearcherList.length}");

        emit(GetAllResearcherSuccess());
      }
    } on DioException catch (e) {
      String errorMessage = "";

      if (e.response != null) {
        errorMessage = e.response!.data['message'] ?? 'An error occurred.';
      } else {
        errorMessage = 'An error occurred.';
      }

      emit(GetAllResearcherError());
    } catch (e) {
      emit(GetAllResearcherError());
    }
  }

  //////////////////////////////////////////////////////////////////////////// get the researches of the researcher ////////////

  List<ResearchesOfResearchers> researchesOfResearchersList = [];
  Future<void> getResearchesOfResearchers({required String id}) async {
    researchesOfResearchersList.clear();
    emit(GetAllResearchesLoading());
    try {
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: "token")}"
      };

      var response =
          await dio.get(baseUrl + "/researchers/researcher/researches/$id");
      if (response.statusCode == 201) {
        List<dynamic> data = response.data['researches'];
        researchesOfResearchersList =
            data.map((json) => ResearchesOfResearchers.fromJson(json)).toList();
        print("success");
        print(
            "researches of researchers list :${researchesOfResearchersList.length}");
        emit(GetAllResearchesSuccess()); // <-- Update this line
      }
    } on DioException catch (e) {
      String errorMessage = "";
      if (e.response != null) {
        errorMessage = e.response?.data['message'] ?? '';
        print(errorMessage.toString());
      }
      emit(GetAllResearchesError());
    } on Exception catch (e) {
      emit(GetAllResearchesError());
      print(e.toString());
    }
  }

  ////////////////////////////////////////////////////////// send grade /////////////////////////////

  Future<void> sendGrade({
    required String student,
    required String research,
    required bool status,
  }) async {
    Map<String, dynamic> params = {
      "student": student,
      "research": research,
      "status": status,
    };
    try {
      emit(SendGradeLoading());
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: 'token')}"
      };
      var response = await dio.post(baseUrl + "/grads/user", data: params);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        emit(SendGradeSuccess(response: response.data));
      }
    } on DioException catch (e) {
      String errorMessage = "";

      if (e.response != null) {
        errorMessage = e.response!.data['message'] ?? 'An error occurred.';
      } else {
        errorMessage = 'An error occurred.';
      }

      emit(SendGradeError(errorMessage.toString()));
    } catch (e) {
      emit(SendGradeError(e.toString()));
    }
  }
}
