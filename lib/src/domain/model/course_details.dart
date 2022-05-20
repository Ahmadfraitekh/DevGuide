class CourseDetailsModel {
  String? name;
  String? description;
  String? link;

  CourseDetailsModel({
    this.name,
    this.description,
    this.link,
  });

  CourseDetailsModel.fromJson(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }

    name = map['name'];
    description = map['description'];
    link = map['link'];
  }

  Map<String, dynamic> toJson(CourseDetailsModel object) {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = object.name;
    data['descipton'] = object.description;
    data['link'] = object.link;

    return data;
  }
}
