import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/cubit/application_states/auth_states.dart';
import 'package:research_app/model/user_model.dart';
import 'package:research_app/utilities/cache_helper.dart';

import '../../screens/notfications/notfications_services.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);
  Dio dio = Dio();
  UserModel? user;
  String? userType;
  bool isStudent = false;
  bool isProfessor = false;
  bool isResearcher = false;
  void changType() {
    if (isStudent) {
      userType = 'student';
      emit(ChangeStudentType(userType!));
    } else if (isProfessor) {
      userType = 'professor';
      emit(ChangeProfessorType(userType!));
    } else if (isResearcher) {
      userType = 'researcher';
      emit(ChangeResearcherType(userType!));
    } else {
      throw Exception('No user type selected');
    }
  }

  String? userGender;
  void saveUserGender({required String gender}) {
    userGender = gender;
    emit(SavedGender());
  }

  Future<void> register({
    required String name,
    required String email,
    required String mobile,
    required String password,
    required String birthDate,
    required String userType,
    required String userGender,
    List<String?>? answers,
    String? hand,
    String? language,
    String? version,
    String? hearingNormal,
    String? origin,
    String? ADHD,
    String? musicalBackground,
  }) async {
    Map<String, dynamic> parms = {
      "name": name,
      "email": email,
      "mobile": mobile,
      'type': userType,
      "password": password,
      "gender": userGender,
      "birthDate": birthDate,
    };

    if (userType == 'student') {
      parms.addAll({
        "hand": answers?[0],
        "language": answers?[1],
        "version": answers?[2],
        "hearingNormal": answers?[3],
        "origin": answers?[4],
        "ADHD": answers?[5],
        "musicalBackground": answers?[6],
      });
    }

    try {
      emit(RegisterLoading());

      var response = await dio.post(baseUrl + "/users/register", data: parms);

      user = UserModel.fromJson(response.data);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        user = UserModel.fromJson(response.data);
        String name = response.data?['name'] ?? '';
        String email = response.data?['email'] ?? '';
        String mobile = response.data?['mobile'] ?? '';
        String gender = response.data?['gender'] ?? '';
        String token = response.data?['token'] ?? '';

        CacheHelper.setData(key: "message", value: user?.message);
        CacheHelper.setData(key: "type", value: response.data?["type"]);
        CacheHelper.setData(key: "name", value: name);
        CacheHelper.setData(key: "email", value: email);
        CacheHelper.setData(key: "mobile", value: mobile);
        CacheHelper.setData(key: "gender", value: gender);
        CacheHelper.setData(key: "token", value: token);
        emit(RegisterSuccess(response: response.data));
        print(response.data['name']);
      }
    } on DioException catch (e) {
      String errorMessage = "";

      if (e.response != null) {
        errorMessage = e.response!.data['message'] ?? 'An error occurred.';
      } else {
        errorMessage = 'An error occurred.';
      }

      emit(RegisterError(errorMessage));
    } catch (e) {
      emit(RegisterError('An error occurred.'));
    }
  }

  Future<void> login({
    required String value,
    required String password,
  }) async {
    Map<String, dynamic> params = {
      "value": value,
      "password": password,
      "fbToken": await FirebaseMessaging.instance.getToken()
    };

    try {
      emit(LoginLoading());
      var response = await dio.post(baseUrl + "/users/login", data: params);
      user = UserModel.fromJson(response.data);
      if (response.statusCode == 200) {
        String token = response.data['token'];
        String value = response.data?['value'] ?? '';
        String password = response.data?['password'] ?? '';
        String name = response.data?['name'] ?? '';

        CacheHelper.setData(key: "token", value: token);
        CacheHelper.setData(key: "value", value: value);
        CacheHelper.setData(key: "password", value: password);
        CacheHelper.setData(key: "name", value: name);
        emit(LoginSuccess(response: response.data));
        print(CacheHelper.getData(key: "value"));
      }
    } on DioException catch (e) {
      String errorMessage = "";

      if (e.response != null) {
        errorMessage = e.response!.data['message'] ?? 'An error occurred.';
      } else {
        errorMessage = 'An error occurred.';
      }

      emit(LoginError(errorMessage));
    } catch (e) {
      emit(LoginError('An error occurred.'));
    }
  }

  IconData visibleicon = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changeVisibilty() {
    isPassword = !isPassword;
    visibleicon = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    emit(ChangePasswordVisibilty());
  }

  Map<String, dynamic> formatAnswers(
      String userType, List<String> questions, List<String?>? answers) {
    Map<String, dynamic> formattedAnswers = {};

    for (int i = 0; i < questions.length; i++) {
      String question = questions[i];
      String? answer = answers?[i];

      formattedAnswers[question] = formatAnswer(userType, question, answer);
    }

    return formattedAnswers;
  }

  String formatAnswer(String userType, String question, String? answer) {
    switch (question) {
      case 'dominant hand ?':
      case 'Native Language ?':
        return answer?.toLowerCase() ?? '';
      case 'Is the vision  normal?':
      case 'Is your hearing normal ?':
      case 'What is your origin':
        return answer?.toLowerCase() ?? '';
      case 'Do you suffer from ADHD?':
      case 'Do you have a musical background?':
        return answer == 'Yes' ? 'yes' : 'no';
      default:
        return answer ?? '';
    }
  }
}
