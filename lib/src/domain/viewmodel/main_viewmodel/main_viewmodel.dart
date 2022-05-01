import 'package:dev_guide/src/presentation/pages/categoryPage/category.dart';
import 'package:dev_guide/src/presentation/pages/favoritePage/favorite.dart';
import 'package:dev_guide/src/presentation/pages/homePage/home.dart';
import 'package:dev_guide/src/presentation/pages/searchPage/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainViewModel extends GetxController {
  static MainViewModel instance = Get.find();
  int _pageIndex = 0;
  PageController? _pageController;
  List<Widget> _pages = [
    const HomePage(),
    const CategroyPage(),
    const SearchPage(),
    const FavoritePage(),
  ];

  int get pageIndex => _pageIndex;
  set pageIndex(int page) => _pageIndex;
  get pageController => _pageController;
  get pages => _pages;

  @override
  void onInit() {
    _pageController = PageController(initialPage: _pageIndex);
    super.onInit();
  }

  @override
  void onReady() {
    _pageController!.dispose();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // void changedIndexValue(int index) {
  //   _pageIndex = index;
  //   update();
  // }

  /// [index] current page index
  void onTabTapped(int index) {
    _pageIndex = index;
    _pageController!.jumpToPage(index);
    update();
  }

  /// [page] current page
  //When page is Changed
  void onPageChange(int page) {
    _pageIndex = page;
    update();
  }
}
