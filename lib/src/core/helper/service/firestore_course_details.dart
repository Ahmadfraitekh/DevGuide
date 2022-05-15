import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreCourseDetails {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('courses');

  Future<List<QueryDocumentSnapshot>> getCoursesFromFirebase() async {
    var value = await _collectionReference.get();
    return value.docs;
  }
}
