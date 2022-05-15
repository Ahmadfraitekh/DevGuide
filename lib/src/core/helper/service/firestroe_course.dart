import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreCourse {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('course');

  Future<List<QueryDocumentSnapshot>> getCourseFromFirebase() async {
    var value = await _collectionReference.get();
    return value.docs;
  }
}
