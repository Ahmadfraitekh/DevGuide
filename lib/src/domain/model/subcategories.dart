class SubCategoriesModel {
  String? catgId;
  String? id;
  String? name;
  String? image;
  String? state;

  SubCategoriesModel({this.catgId, this.id, this.name, this.image, this.state});

  SubCategoriesModel.fromJson(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }

    catgId = map['catgId'];
    id = map['id'];
    name = map['name'];
    image = map['image'];
    state = map['state'];
  }

  Map<String, dynamic> toJson(SubCategoriesModel object) {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['catgId'] = object.catgId;
    data['id'] = object.id;
    data['name'] = object.name;
    data['image'] = object.image;
    data['state'] = object.state;

    return data;
  }
}
