import 'package:dev_guide/src/core/helper/service/firestroe_course.dart';
import 'package:dev_guide/src/domain/model/course_details.dart';
import 'package:get/get.dart';

class CourseDetailsViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // getCourseDeatils();
  }

  static CourseDetailsViewModel instance = Get.find();

  bool isFav = false;
  List<CourseDetailsModel> _courseDetailsModel = [];

  List<CourseDetailsModel> get courseDetailsModel => _courseDetailsModel;

  getCourseDeatils() async {
    await FireStoreCourse().getCoursesFromFirebase().then((value) {
      for (int i = 0; i < value.length; i++) {
        _courseDetailsModel.add(CourseDetailsModel.fromJson(
            value[i].data() as Map<dynamic, dynamic>));

        //print(value[i]);
      }

      update();
    });
  }

  getFavToList() {
    isFav = !isFav;

    update();
  }
}
