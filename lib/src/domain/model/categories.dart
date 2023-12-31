class CategoriesModel {
  String? id;
  String? name;
  String? image;
  String? state;
  String? catgId;

  CategoriesModel({this.id, this.name, this.image, this.state, this.catgId});

  CategoriesModel.fromJson(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }

    id = map['id'];
    name = map['name'];
    image = map['image'];
    state = map['state'];
    catgId = map['catgId'];
  }

  Map<String, dynamic> toJson(CategoriesModel object) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = object.id;

    data['name'] = object.name;

    data['image'] = object.image;
    data['state'] = object.state;

    data['catgId'] = object.catgId;

    return data;
  }
}
