import 'package:dev_guide/src/core/routes_name.dart';

import 'package:get/get.dart';

class SliderViewModel extends GetxController {
  static SliderViewModel instance = Get.find();

  int _activeIndex = 0;

  List get urlImages => _urlImages;
  List get textImages => _textImages;
  get activeIndex => _activeIndex;
  get getBooks => _getBooksFromWebSite();

  final _urlImages = [
    'https://miro.medium.com/max/1400/0*E0oXyDylhIc78F2q',
    'https://imgs.abduzeedo.com/files/wallpapers/wpw172/wp_1680.jpg',
    'https://online.csp.edu/wp-content/uploads/2020/06/csp_article_beginner-programming-languages_header.jpg',
  ];

  final List<String> _textImages = [
    'Find the book you need here',
    'Focusing is about saying NO',
    '',
  ];

  final String _booksLink = 'https://books.goalkicker.com/';

  void _getBooksFromWebSite() {
    Get.toNamed(
      RoutesName.webView,
      arguments: {'link': _booksLink},
    );
  }

  void sliderPageChange(int indexValue) {
    _activeIndex = indexValue;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
