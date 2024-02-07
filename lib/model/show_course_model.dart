class CourseByIdModel {
  Data? data;

  CourseByIdModel({this.data});

  CourseByIdModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? shortDescription;
  String? longDescription;
  String? image;
  String? img;

  Data({
    this.id,
    this.title,
    this.shortDescription,
    this.longDescription,
    this.image,
    this.img,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['short_description'] = shortDescription;
    data['long_description'] = longDescription;
    data['image'] = image;

    return data;
  }
}
