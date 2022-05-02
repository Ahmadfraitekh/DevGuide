import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_guide/src/domain/model/slider.dart';

class FireStoreSlider {
  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection('slider');

  Future<void> addUserToFireStore(SliderModel sliderModel) async {
    await _userCollectionRef.doc(sliderModel.id).set(sliderModel.toJson());
  }
}
