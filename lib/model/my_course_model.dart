class MyCoursesModel {
  List<MyCourses>? courses;

  MyCoursesModel({this.courses});

  MyCoursesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      courses = <MyCourses>[];
      json['data'].forEach((v) {
        courses!.add(MyCourses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (courses != null) {
      data['data'] = courses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyCourses {
  int? id;
  String? title;
  String? shortDescription;
  String? longDescription;
  String? image;
  String? img;

  MyCourses({
    this.id,
    this.title,
    this.shortDescription,
    this.longDescription,
    this.image,
    this.img,
  });

  MyCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    image = json['image'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['short_description'] = shortDescription;
    data['long_description'] = longDescription;
    data['image'] = image;
    data['img'] = img;
    return data;
  }
}
