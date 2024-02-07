class HomeCourseModel {
  String? message;
  List<HomeCourse>? data;
  bool? status;
  int? code;

  HomeCourseModel({this.message, this.data, this.status, this.code});

  HomeCourseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <HomeCourse>[];
      json['data'].forEach((v) {
        data!.add(new HomeCourse.fromJson(v));
      });
    }
    status = json['status'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['code'] = this.code;
    return data;
  }
}

class HomeCourse {
  int? id;
  String? name;
  List<Courses>? courses;

  HomeCourse({this.id, this.name, this.courses});

  HomeCourse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.courses != null) {
      data['courses'] = this.courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Courses {
  int? id;
  String? title;
  String? shortDescription;
  String? longDescription;
  String? image;
  String? img;
  Featured? featured;
  Featured? status;

  Courses(
      {this.id,
        this.title,
        this.shortDescription,
        this.longDescription,
        this.image,
        this.img,
        this.featured,
        this.status});

  Courses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    image = json['image'];
    img = json['img'];
    featured = json['featured'] != null
        ? new Featured.fromJson(json['featured'])
        : null;
    status =
    json['status'] != null ? new Featured.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;
    data['image'] = this.image;
    data['img'] = this.img;
    if (this.featured != null) {
      data['featured'] = this.featured!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    return data;
  }
}

class Featured {
  String? name;
  int? value;

  Featured({this.name, this.value});

  Featured.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}
