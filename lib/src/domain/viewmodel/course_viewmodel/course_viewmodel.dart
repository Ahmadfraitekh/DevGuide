import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dev_guide/src/core/helper/service/firestroe_course.dart';

import 'package:dev_guide/src/domain/model/course.dart';
import 'package:get/get.dart';

class CourseViewModel extends GetxController {
  static CourseViewModel instance = Get.find();
  List<CourseModel> _courseModel = [];

  @override
  void onInit() {
    super.onInit();
    getCourse();
    // getSearch();
  }

  List<CourseModel> get courseModel => _courseModel;
  //dynamic get getSearch => _getSearch();

  getCourse() async {
    await FireStoreCourse().getCourseFromFirebase().then((value) {
      for (int i = 0; i < value.length; i++) {
        _courseModel.add(
            CourseModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        print(value[i]);
      }

      update();
    });
  }

  Future getSearch(String name) async {
    CollectionReference _ref = FirebaseFirestore.instance.collection('courses');

    var value = await _ref.where("name", isEqualTo: name).get();
    return value;
  }
}
