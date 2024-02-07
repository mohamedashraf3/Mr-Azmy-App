import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_azmi/view_model/data/network/dio_helper.dart';
import 'package:mr_azmi/view_model/data/network/end_points.dart';

import '../../data/local/shared_prefrence/shared_keys.dart';
import '../../data/local/shared_prefrence/shared_prefrence.dart';
import '../../utils/toasts_notification.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobilePhone = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? loginError;

  List<Map<String, dynamic>>? enrolledCourses;

  Future<void> loginWithApi({required BuildContext context}) async {
    emit(LoginLoadingState());
    await DioHelper.post(
      endpoint: EndPoints.login,
      body: {"phone": mobilePhone.text, "password": passwordController.text},
    ).then((value) {
      print(value?.data);
      handleEnrolledCourses(value!);
      saveDataToLocal(value.data);
      NotificationHelper.showSuccessNotification(
          description: value.data['message'], context: context);
      emit(LoginSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        loginError = error.response?.data['message'];
      }
      emit(LoginErrorState());
      throw error;
    });
  }

  String? nameError;
  String? phoneError;

  Future<void> registerWithApi({required BuildContext context}) async {
    emit(RegisterLoadingState());
    await DioHelper.post(
      endpoint: EndPoints.register,
      body: {
        "name": nameController.text,
        "phone": mobilePhone.text,
        "password": passwordController.text
      },
    ).then((value) {
      saveDataToLocal(value?.data);
      NotificationHelper.showSuccessNotification(
          description: value?.data['message'], context: context);
      emit(RegisterSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        nameError = (error.response?.data["data"]["name"] as List<dynamic>?)
            ?.first
            ?.toString();
        phoneError = (error.response?.data["data"]["phone"] as List<dynamic>?)
            ?.first
            ?.toString();
      }
      emit(RegisterErrorState());
      throw error;
    });
  }

  Future<void> logoutWithApi({required BuildContext context}) async {
    emit(LogoutLoadingState());
    await DioHelper.post(
      endpoint: EndPoints.logout,
      token: LocalData.get(SharedKeys.token),
    ).then((value) {
      NotificationHelper.showSuccessNotification(
          description: value?.data['message'], context: context);
      restControllers();
      LocalData.removeData(SharedKeys.isLogin);
      LocalData.removeData(SharedKeys.enrolledCourses);
      LocalData.removeData(SharedKeys.token);
      LocalData.removeData(SharedKeys.username);
      emit(LogoutSuccessState());
    }).catchError((error) {
      if (error is DioException) {}
      emit(LogoutErrorState());
      throw error;
    });
  }

  void saveDataToLocal(Map<String, dynamic> value) {
    LocalData.set(key: SharedKeys.isLogin, value: true);
    LocalData.set(key: SharedKeys.token, value: value['data']['token']);
    LocalData.set(
      key: SharedKeys.username,
      value: value['data']['username'].toString(),
    );
  }

  Future<void> restControllers() async {
    mobilePhone.clear();
    passwordController.clear();
    nameController.clear();
    confirmPassController.clear();
    loginFormKey = GlobalKey<FormState>();
    registerFormKey = GlobalKey<FormState>();
  }

  void restError() {
    loginError = null;
    nameError = null;
    phoneError = null;
  }

  void handleEnrolledCourses(Response value) async {
    enrolledCourses = (value.data['data']['enrolled_courses'] as List<dynamic>)
        .cast<Map<String, dynamic>>();

    String enrolledCoursesJson = jsonEncode(enrolledCourses);
    LocalData.set(key: SharedKeys.enrolledCourses, value: enrolledCoursesJson);
  }

  bool isCourseEnrolled(int? courseId) {
    List<Map<String, dynamic>>? enrolledCourses =
        getEnrolledCoursesFromStorage();

    if (enrolledCourses == null) return false;

    for (var enrolledCourse in enrolledCourses) {
      if (enrolledCourse['course_id'] == courseId) {
        return true;
      }
    }
    return false;
  }

  List<Map<String, dynamic>>? getEnrolledCoursesFromStorage() {
    String? enrolledCourseJson = LocalData.get(SharedKeys.enrolledCourses);
    if (enrolledCourseJson != null) {
      return (jsonDecode(enrolledCourseJson) as List<dynamic>)
          .cast<Map<String, dynamic>>();
    }
    return null;
  }
}
