import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_guide/src/domain/model/user.dart';

class FireStoreUser {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> addUserToFireStore(UserModel userModel) async {
    await _userCollectionRef.doc(userModel.userId).set(userModel.toJson());
  }

  Future<DocumentSnapshot> getCurrentUser(String uid) async {
    return await _userCollectionRef.doc(uid).get();
  }
}
