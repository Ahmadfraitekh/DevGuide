import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreCategories {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('category');

  Future<List<QueryDocumentSnapshot>> getCategoryFromFirebase() async {
    var value = await _collectionReference.get();
    return value.docs;
  }
}
