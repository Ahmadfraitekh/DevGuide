class SliderModel {
  String? id;
  String? desc;

  SliderModel({
    this.id,
    this.desc,
  });

  SliderModel.fromJson(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }

    id = map['id'];
    desc = map['desc'];
  }

  toJson() {
    return {
      'id': id,
      'desc': desc,
    };
  }
}
