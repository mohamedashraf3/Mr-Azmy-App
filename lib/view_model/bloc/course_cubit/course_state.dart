part of 'course_cubit.dart';

abstract class CourseState {}

class CourseInitial extends CourseState {}

class GetHomeCourseLoadingState extends CourseState {}
class GetHomeCourseSuccessState extends CourseState {}
class GetHomeCourseErrorState extends CourseState {}
class UpdateOpenIndexSuccessState extends CourseState {}
class GetAllCoursesLoadingState extends CourseState {}
class GetAllCoursesSuccessState extends CourseState {}
class GetAllCoursesErrorState extends CourseState {}
class GetEnrolledCoursesLoadingState extends CourseState {}
class GetEnrolledCoursesSuccessState extends CourseState {}
class GetEnrolledCoursesErrorState extends CourseState {}
class EnrollNewCourseLoadingState extends CourseState {}
class EnrollNewCourseSuccessState extends CourseState {}
class EnrollNewCourseErrorState extends CourseState {}
class ShowCourseByIdLoadingState extends CourseState {}
class ShowCourseByIdSuccessState extends CourseState {}
class ShowCourseByIdErrorState extends CourseState {}
class WatchCourseByIdLoadingState extends CourseState {}
class WatchCourseByIdSuccessState extends CourseState {}
class WatchCourseByIdErrorState extends CourseState {}
class UpdateVideoUrlState extends CourseState {}
class IntiVideoControllerState extends CourseState {}
class DisposeVideoControllerState extends CourseState {}

