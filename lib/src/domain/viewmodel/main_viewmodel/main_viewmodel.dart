import 'package:dev_guide/src/presentation/pages/categoryPage/category.dart';
import 'package:dev_guide/src/presentation/pages/favoritePage/favorite.dart';
import 'package:dev_guide/src/presentation/pages/homePage/home.dart';
import 'package:dev_guide/src/presentation/pages/searchPage/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainViewModel extends GetxController {
  int _navigatorValue = 0;

  Widget _currentPage = HomePage();

  get navigatorValue => _navigatorValue;
  get currentPage => _currentPage;

  void changeSelectedValue(int indexValue) {
    _navigatorValue = indexValue;

    switch (indexValue) {
      case 0:
        _currentPage = HomePage();
        break;
      case 1:
        _currentPage = CategroyPage();
        break;
      case 2:
        _currentPage = SearchPage();
        break;
      case 3:
        _currentPage = FavoritePage();
        break;
    }
    update();
  }
}
