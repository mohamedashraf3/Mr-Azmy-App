class AllCoursesModel {
  List<Data>? data;

  AllCoursesModel({this.data});

  AllCoursesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  List<Courses>? courses;

  Data({this.id, this.name, this.courses});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(Courses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (courses != null) {
      data['courses'] = courses!.map((v) => v.toJson()).toList();
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

  Courses({
    this.id,
    this.title,
    this.shortDescription,
    this.longDescription,
    this.image,
    this.img,
  });

  Courses.fromJson(Map<String, dynamic> json) {
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
