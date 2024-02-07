class EnrolledLoginCourseModel {
  DataEnrolledLogin? data;
  int? code;

  EnrolledLoginCourseModel({this.data, this.code});

  EnrolledLoginCourseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataEnrolledLogin.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class DataEnrolledLogin {
    List<EnrolledCourses>? enrolledCourses;

  DataEnrolledLogin({this.enrolledCourses});

  DataEnrolledLogin.fromJson(Map<String, dynamic> json) {
    if (json['enrolled_courses'] != null) {
      enrolledCourses = <EnrolledCourses>[];
      for (var course in json['enrolled_courses']) {
        enrolledCourses!.add(EnrolledCourses.fromJson(course));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.enrolledCourses != null) {
      data['enrolled_courses'] =
          this.enrolledCourses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EnrolledCourses {
  int? courseId;
  String? courseName;

  EnrolledCourses({this.courseId, this.courseName});

  EnrolledCourses.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    courseName = json['course_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    data['course_name'] = this.courseName;
    return data;
  }
}
