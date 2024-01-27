import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:research_app/app_manager/local_data.dart';
import 'package:research_app/cubit/application_states/auth_states.dart';
import 'package:research_app/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:research_app/utilities/cache_helper.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);
  Dio dio = Dio();
  UserModel? user;
  String? userGender;

  void saveUserGender({required String gender}) {
    userGender = gender;
    emit(SavedGender());
  }

  bool isStudent = true;
  bool isProfessor = false;
  bool isResearcher = false;
  String? userType;
  changType() async {
    if (isStudent) {
      userType = 'student';
      emit(ChangeStudentType(userType!));
      print("ssssssssssssssss$userType");
    } else if (isProfessor) {
      userType = 'professor';
      emit(ChangeStudentType(userType!));
      print("ppppppppppppppppppppp$userType");
    } else if (isResearcher) {
      userType = 'researcher';
      emit(ChangeStudentType(userType!));
      print("rrrrrrrrrrrrrrrrrrrrr$userType");
    } else {
      throw Exception('No user type selected');
    }
  }

  Future<void> register({
    required String name,
    required String email,
    required String mobile,
    required String password,
    required String birthDate,
    required String userGender,
    required String userType,
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
        CacheHelper.setData(key: "type", value: userType);
        emit(RegisterSuccess(response: response.data));
        print(response.data['name']);
        print(response.data['type']);
      }
    } on DioException catch (e) {
      String errorMessage = "";

      if (e.response != null) {
        errorMessage = e.response!.data['message'] ?? 'An error occurred.';
      } else {
        errorMessage = 'error.';
      }

      emit(RegisterError(errorMessage));
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }

  Future<void> login({
    required String value,
    required String password,
  }) async {
    Map<String, dynamic> params = {
      "value": value,
      "password": password,
      "firebaseToken": await FirebaseMessaging.instance.getToken(),
    };

    try {
      emit(LoginLoading());
      var response = await dio.post(baseUrl + "/users/login", data: params);
      user = UserModel.fromJson(response.data);
      if (response.statusCode == 200) {
        String token = response.data['token'];
        String value = response.data['value'];
        String password = response.data['password'];
        String firebaseToken = response.data['firebaseToken'];

        CacheHelper.setData(key: "token", value: token);
        CacheHelper.setData(key: "value", value: value);
        CacheHelper.setData(key: "password", value: password);
        CacheHelper.setData(key: "firebaseToken", value: firebaseToken);
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
      emit(RegisterError('An error occurred.'));
    }
  }

  IconData visibleicon = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changeVisibilty() {
    isPassword = !isPassword;
    visibleicon = isPassword ? Icons.visibility_off_outlined : Icons.visibility;
    emit(ChangePasswordVisibilty());
  }
}
