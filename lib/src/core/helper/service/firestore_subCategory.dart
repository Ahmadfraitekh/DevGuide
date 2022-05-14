import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreSubCategories {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('subCategory');

  Future<List<QueryDocumentSnapshot>> getSubCategoryFromFirebase() async {
    var value = await _collectionReference.get();
    return value.docs;
  }
}
