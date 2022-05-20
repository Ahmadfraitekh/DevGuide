class CourseModel {
  String? catgId;
  String? subCatgId;
  String? id;
  String? name;
  String? image;
  String? state;
  String? desc;
  List? courses;

  CourseModel({
    this.catgId,
    this.subCatgId,
    this.id,
    this.name,
    this.image,
    this.state,
    this.desc,
    this.courses,
  });

  CourseModel.fromJson(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }

    catgId = map['catgId'];
    subCatgId = map['subCatgId'];
    id = map['id'];
    name = map['name'];
    image = map['image'];
    state = map['state'];
    desc = map['desc'];
    courses = map['courses'];
  }

  Map<String, dynamic> toJson(CourseModel object) {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['catgId'] = object.catgId;
    data['subCatgId'] = object.subCatgId;
    data['id'] = object.id;
    data['name'] = object.name;
    data['image'] = object.image;
    data['state'] = object.state;
    data['desc'] = object.desc;
    data['courses'] = object.courses;

    return data;
  }
}
