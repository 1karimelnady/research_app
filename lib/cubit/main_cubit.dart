import 'dart:core';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/utilities/cache_helper.dart';

import '../model/researches_model.dart';
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

  void onFirstChanged(int index, String answer) {
    int keyIndex =
        firstKeys.indexWhere((element) => element.keys.first == "hand[$index]");
    if (!handArray.contains(answer)) {
      handArray.add(answer);
      if (keyIndex == -1) {
        firstKeys.add({"hand[$index]": answer});
      } else {
        firstKeys[keyIndex]["hand[$index]"] = answer;
      }
    } else {
      handArray.remove(answer);
      if (keyIndex != -1) {
        firstKeys.removeAt(keyIndex);
      }
    }
    isFirstQuestionChecked = handArray.contains('left');
    isSecondQuestionChecked = handArray.contains('right');
    print(firstKeys);
    print(handArray);
    print(isFirstQuestionChecked);
    print(isSecondQuestionChecked);
    emit(HandState());
  }

  List<Map<String, dynamic>> secondKeys = [];

  bool isFirstSecondQuestionChecked = false;
  bool isSecondSecondQuestionChecked = false;
  bool isThirdSecondQuestionChecked = false;

  void onSecondChanged(int index, String answer) {
    int keyIndex = secondKeys
        .indexWhere((element) => element.keys.first == "language[$index]");
    if (!languageArray.contains(answer)) {
      languageArray.add(answer);
      if (keyIndex == -1) {
        secondKeys.add({"language[$index]": answer});
      } else {
        secondKeys[keyIndex]["language[$index]"] = answer;
      }
    } else {
      languageArray.remove(answer);
      if (keyIndex != -1) {
        secondKeys.removeAt(keyIndex);
      }
    }
    isFirstSecondQuestionChecked = languageArray.contains('english');
    isSecondSecondQuestionChecked = languageArray.contains('hebrew');
    isThirdSecondQuestionChecked = languageArray.contains('arabic');
    print(secondKeys);
    print(languageArray);
    print(isFirstSecondQuestionChecked);
    print(isSecondSecondQuestionChecked);
    print(isThirdSecondQuestionChecked);
    emit(LanguageState());
  }

  List<Map<String, dynamic>> thirdKeys = [];

  bool isFirstThirdQuestionChecked = false;
  bool isSecondThirdQuestionChecked = false;

  void onThirdChanged(int index, String answer) {
    int keyIndex = thirdKeys
        .indexWhere((element) => element.keys.first == "vision[$index]");
    if (!visionArray.contains(answer)) {
      visionArray.add(answer);
      if (keyIndex == -1) {
        thirdKeys.add({"vision[$index]": answer});
      } else {
        thirdKeys[keyIndex]["vision[$index]"] = answer;
      }
    } else {
      visionArray.remove(answer);
      if (keyIndex != -1) {
        thirdKeys.removeAt(keyIndex);
      }
    }
    isFirstThirdQuestionChecked = visionArray.contains('normal');
    isSecondThirdQuestionChecked = visionArray.contains('notNormal');

    print(thirdKeys);
    print(visionArray);
    print(isFirstThirdQuestionChecked);
    print(isSecondThirdQuestionChecked);
    emit(VisionState());
  }

  List<Map<String, dynamic>> fourthKeys = [];

  bool isFirstFourthQuestionChecked = false;
  bool isSecondFourthQuestionChecked = false;

  void onFourthChanged(int index, String answer) {
    int keyIndex = fourthKeys
        .indexWhere((element) => element.keys.first == "hearingNormal[$index]");
    if (!hearingArray.contains(answer)) {
      hearingArray.add(answer);
      if (keyIndex == -1) {
        fourthKeys.add({"hearingNormal[$index]": answer});
      } else {
        fourthKeys[keyIndex]["hearingNormal[$index]"] = answer;
      }
    } else {
      hearingArray.remove(answer);
      if (keyIndex != -1) {
        fourthKeys.removeAt(keyIndex);
      }
    }
    isFirstFourthQuestionChecked = hearingArray.contains('yes');
    isSecondFourthQuestionChecked = hearingArray.contains('no');

    print(fourthKeys);
    print(hearingArray);
    print(isFirstFourthQuestionChecked);
    print(isSecondFourthQuestionChecked);
    emit(HearingNormalAState());
  }

  List<Map<String, dynamic>> fifthKeys = [];

  bool isFirstFifthQuestionChecked = false;
  bool isSecondFifthQuestionChecked = false;

  void onFifthChanged(int index, String answer) {
    int keyIndex = fifthKeys
        .indexWhere((element) => element.keys.first == "origin[$index]");
    if (!originArray.contains(answer)) {
      originArray.add(answer);
      if (keyIndex == -1) {
        fifthKeys.add({"origin[$index]": answer});
      } else {
        fifthKeys[keyIndex]["origin[$index]"] = answer;
      }
    } else {
      originArray.remove(answer);
      if (keyIndex != -1) {
        fifthKeys.removeAt(keyIndex);
      }
    }
    isFirstFifthQuestionChecked = originArray.contains('usa');
    isSecondFifthQuestionChecked = originArray.contains('israel');

    print(fifthKeys);
    print(originArray);
    print(isFirstFifthQuestionChecked);
    print(isSecondFifthQuestionChecked);
    emit(OriginState());
  }

  List<Map<String, dynamic>> sixthKeys = [];

  bool isFirstSixthQuestionChecked = false;
  bool isSecondSixthQuestionChecked = false;

  void onSixthChanged(int index, String answer) {
    int keyIndex =
        sixthKeys.indexWhere((element) => element.keys.first == "ADHD[$index]");
    if (!ADHDArray.contains(answer)) {
      ADHDArray.add(answer);
      if (keyIndex == -1) {
        sixthKeys.add({"ADHD[$index]": answer});
      } else {
        sixthKeys[keyIndex]["ADHD[$index]"] = answer;
      }
    } else {
      ADHDArray.remove(answer);
      if (keyIndex != -1) {
        sixthKeys.removeAt(keyIndex);
      }
    }
    isFirstSixthQuestionChecked = ADHDArray.contains('yes');
    isSecondSixthQuestionChecked = ADHDArray.contains('no');

    print(sixthKeys);
    print(ADHDArray);
    print(isFirstSixthQuestionChecked);
    print(isSecondSixthQuestionChecked);
    emit(ADHDState());
  }

  List<Map<String, dynamic>> seventhKeys = [];

  bool isFirstSeventhQuestionChecked = false;
  bool isSecondSeventhQuestionChecked = false;

  void onSeventhChanged(int index, String answer) {
    int keyIndex = seventhKeys.indexWhere(
        (element) => element.keys.first == "musicalBackground[$index]");
    if (!musicalBackgroundArray.contains(answer)) {
      musicalBackgroundArray.add(answer);
      if (keyIndex == -1) {
        seventhKeys.add({"musicalBackground[$index]": answer});
      } else {
        seventhKeys[keyIndex]["musicalBackground[$index]"] = answer;
      }
    } else {
      musicalBackgroundArray.remove(answer);
      if (keyIndex != -1) {
        seventhKeys.removeAt(keyIndex);
      }
    }
    isFirstSeventhQuestionChecked = musicalBackgroundArray.contains('yes');
    isSecondSeventhQuestionChecked = musicalBackgroundArray.contains('no');

    print(seventhKeys);
    print(musicalBackgroundArray);
    print(isFirstSeventhQuestionChecked);
    print(isSecondSeventhQuestionChecked);
    emit(MusicalBackgroundState());
  }

  Future<void> createResearch({
    required String researchQuestion,
    required String credits,
    required Uint8List approvment,
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

    try {
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: 'token')}"
      };

      Response response =
          await dio.get(baseUrl + "/researchers/user/researchs");

      if (response.statusCode == 201) {
        List<dynamic> data = response.data['researches'];

        researchesList = data.map((json) => Researches.fromJson(json)).toList();

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
    print("kkkkkkkkkk");

    studentResearchesList.clear();
    try {
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: "token")}"
      };

      var response = await dio.get(baseUrl + "/researchers/researchs/filter");
      if (response.statusCode == 200) {
        (response.data as List).forEach((element) {
          studentResearchesList.add(StudentResearchesModel.fromJson(element));
        });
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
    try {
      emit(StudentRegisterResearchLoadingState());
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: "token")}"
      };

      var response = await dio.put(baseUrl + "/students/research/register",
          data: {"research": "${CacheHelper.getData(key: "_id")}"});
      if (response.statusCode == 200) {
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

  List<ResearchesStatus> studentResearchesStatusList = [];
  Future<void> getStudentResearchesStatus({required String status}) async {
    emit(GetStudentResearchesLoadingState());
    studentResearchesStatusList.clear();

    try {
      emit(GetStudentResearchesLoadingState());
      dio.options.headers = {
        "Authorization": "Bearer ${CacheHelper.getData(key: "token")}"
      };

      var response = await dio
          .get(baseUrl + "/students/student/researches?status=$status");

      if (response.statusCode == 201) {
        List<dynamic> data = response.data['researches'];

        studentResearchesStatusList =
            data.map((json) => ResearchesStatus.fromJson(json)).toList();

        // (response as List<dynamic>).forEach((element) {
        //   studentResearchesStatusList.add(ResearchesStatus.fromJson(element));
        // });
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
}
