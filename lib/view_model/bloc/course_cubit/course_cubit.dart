import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mr_azmi/model/all_courses_model.dart';
import 'package:mr_azmi/model/home_courses_model.dart';
import 'package:mr_azmi/model/my_course_model.dart';
import 'package:mr_azmi/model/sections_model.dart';
import 'package:mr_azmi/model/show_course_model.dart';
import 'package:mr_azmi/view_model/data/local/shared_prefrence/shared_keys.dart';
import 'package:mr_azmi/view_model/data/local/shared_prefrence/shared_prefrence.dart';
import 'package:mr_azmi/view_model/data/network/dio_helper.dart';
import 'package:mr_azmi/view_model/data/network/end_points.dart';
import 'package:mr_azmi/view_model/utils/toasts_notification.dart';
import 'package:video_player/video_player.dart';

part 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit() : super(CourseInitial());

  static CourseCubit get(context) => BlocProvider.of<CourseCubit>(context);
  int? openIndex;
  int? selectedLessonId;
  String? selectedVideoUrl;
  String? selectedVideoName;
  HomeCourseModel? homeCourseModel;

  Future<void> getHomeCourse() async {
    emit(GetHomeCourseLoadingState());
    await DioHelper.get(
      endpoint: EndPoints.homeCourse,
    ).then((value) {
      homeCourseModel = HomeCourseModel.fromJson(value?.data);
      emit(GetHomeCourseSuccessState());
    }).catchError((error) {
      print(error);
      emit(GetHomeCourseErrorState());
      throw error;
    });
  }

  void updateOpenIndex(int? index) {
    openIndex = index;
    emit(UpdateOpenIndexSuccessState());
  }

  AllCoursesModel? allCoursesModel;

  Future<void> getAllCourse() async {
    emit(GetAllCoursesLoadingState());
    await DioHelper.get(endpoint: EndPoints.allCourses).then((value) {
      allCoursesModel = AllCoursesModel.fromJson(value?.data);
      emit(GetAllCoursesSuccessState());
    }).catchError((error) {
      emit(GetAllCoursesErrorState());
      throw error;
    });
  }

  MyCoursesModel? myCoursesModel;

  Future<void> getEnrolledCourses() async {
    emit(GetEnrolledCoursesLoadingState());
    await DioHelper.get(
            endpoint: EndPoints.myCourses,
            token: LocalData.get(SharedKeys.token))
        .then((value) {
      myCoursesModel = MyCoursesModel.fromJson(value?.data);
      emit(GetEnrolledCoursesSuccessState());
    }).catchError((error) {
      emit(GetEnrolledCoursesErrorState());
      throw error;
    });
  }

  CourseByIdModel? courseByIdModel;

  Future<void> showCourseById({required int id}) async {
    emit(ShowCourseByIdLoadingState());
    await DioHelper.get(endpoint: "${EndPoints.showCourse}/$id").then((value) {
      courseByIdModel = CourseByIdModel.fromJson(value?.data);
      emit(ShowCourseByIdSuccessState());
    }).catchError((error) {
      emit(ShowCourseByIdErrorState());
      throw error;
    });
  }

  SectionModel? sectionModel;

  Future<void> watchCourseById({required int id}) async {
    emit(WatchCourseByIdLoadingState());
    await DioHelper.get(
            token: LocalData.get(SharedKeys.token),
            endpoint: "${EndPoints.watchCourse}/$id")
        .then((value) {
      sectionModel = SectionModel.fromJson(value?.data);
      emit(WatchCourseByIdSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        print(error.response);
      }
      emit(WatchCourseByIdErrorState());
      throw error;
    });
  }

  Future<void> enrollNewCourse(
      {required int id, required BuildContext context}) async {
    emit(EnrollNewCourseLoadingState());
    await DioHelper.post(
            endpoint: EndPoints.courseEnrollment,
            body: {
              "course_id": id,
            },
            token: LocalData.get(SharedKeys.token))
        .then((value) {
      NotificationHelper.showSuccessNotification(
          description: value?.data['message'], context: context);
      emit(EnrollNewCourseSuccessState());
    }).catchError((error) {
      if (error is DioException) {
        print(error);
        NotificationHelper.showInfoNotification(
            description: error.response?.data['message'], context: context);
      }
      emit(EnrollNewCourseErrorState());
      throw error;
    });
  }

  void updateSelectedVideo(
      {required String? videoUrl,
      required String? videoName,
      required int? lessonId}) {
    selectedVideoUrl = videoUrl;
    selectedVideoName = videoName;
    selectedLessonId = lessonId;
    initializeVideoController();
    emit(UpdateVideoUrlState());
  }

  VideoPlayerController? videoPlayerController;

  void initializeVideoController() {
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
    }
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(selectedVideoUrl ?? ""));
    emit(IntiVideoControllerState());
  }

  void disposeVideoController() {
    videoPlayerController?.dispose();
    emit(DisposeVideoControllerState());
  }
}
