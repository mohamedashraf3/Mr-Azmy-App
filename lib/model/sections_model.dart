class SectionModel {
  SectionData? data;

  SectionModel({ this.data});

  SectionModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new SectionData.fromJson(json['data']) : null;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SectionData {
  int? id;
  String? title;

  String? image;

  List<Sections>? sections;

  SectionData(
      {this.id,
        this.title,

        this.image,
        this.sections});

  SectionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
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

class Sections {
  int? id;
  String? title;
  Featured? status;
  List<SubSections>? subSections;

  Sections({this.id, this.title, this.status, this.subSections});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status =
    json['status'] != null ? new Featured.fromJson(json['status']) : null;
    if (json['sub_sections'] != null) {
      subSections = <SubSections>[];
      json['sub_sections'].forEach((v) {
        subSections!.add(new SubSections.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.subSections != null) {
      data['sub_sections'] = this.subSections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubSections {
  int? id;
  String? title;
  Featured? status;
  List<Lessons>? lessons;

  SubSections({this.id, this.title, this.status, this.lessons});

  SubSections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status =
    json['status'] != null ? new Featured.fromJson(json['status']) : null;
    if (json['lessons'] != null) {
      lessons = <Lessons>[];
      json['lessons'].forEach((v) {
        lessons!.add(new Lessons.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.lessons != null) {
      data['lessons'] = this.lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lessons {
  int? id;
  String? title;
  Featured? status;
  String? videoUrl;

  Lessons({this.id, this.title, this.status, this.videoUrl});

  Lessons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status =
    json['status'] != null ? new Featured.fromJson(json['status']) : null;
    videoUrl = json['video_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    data['video_url'] = this.videoUrl;
    return data;
  }
}
