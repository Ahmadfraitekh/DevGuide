import 'package:dev_guide/src/core/routes_name.dart';

import 'package:get/get.dart';

class SliderViewModel extends GetxController {
  static SliderViewModel instance = Get.find();

  int activeIndex = 0;

  List get urlImages => _urlImages;
  List get textImages => _textImages;

  get getBooks => _getBooksFromWebSite();

  final _urlImages = [
    'https://miro.medium.com/max/1400/0*E0oXyDylhIc78F2q',
    'https://imgs.abduzeedo.com/files/wallpapers/wpw172/wp_1680.jpg',
    'https://c4.wallpaperflare.com/wallpaper/962/970/355/code-web-development-development-html-wallpaper-preview.jpg',
  ];

  final List<String> _textImages = [
    'Find the book you need here ',
    'Focusing is about saying NO.',
    'Create a webpage using HTML',
  ];

  final String _booksLink = 'https://books.goalkicker.com/';

  void _getBooksFromWebSite() {
    Get.offNamedUntil(
      RoutesName.webView,
      (route) => false,
      arguments: {'link': _booksLink},
    );
  }
}
