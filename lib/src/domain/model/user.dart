import 'dart:math';

class UserModel {
  String? userId;
  String? email;
  String? fullName;

  UserModel({
    this.userId,
    this.email,
    this.fullName,
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

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'email': email,
      'fullName': fullName,
    };
  }
}
