import 'package:dev_guide/src/core/constants.dart';

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

    userId = map[Constants.userID];
    email = map[Constants.userEmail];
    fullName = map[Constants.userName];
  }

  toJson() {
    return {
      Constants.userID: userId,
      Constants.userEmail: email,
      Constants.userName: fullName,
    };
  }
}
