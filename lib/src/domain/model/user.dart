class UserModel {
  String? userId, email, fullName;

  UserModel({
    required this.userId,
    required this.email,
    required this.fullName,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }

    userId = map['userId'];
    email = map['email'];
    fullName = map['fullName'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'fullName': fullName,
    };
  }
}
