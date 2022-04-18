import 'package:flutter/material.dart';

import 'package:dev_guide/src/core/constants.dart';

import 'package:dev_guide/src/presentation/pages/categoryPage/category.dart';
import 'package:dev_guide/src/presentation/pages/favoritePage/favorite.dart';
import 'package:dev_guide/src/presentation/pages/homePage/home.dart';
import 'package:dev_guide/src/presentation/pages/searchPage/search.dart';
import 'package:dev_guide/src/presentation/resources/assets_manager.dart';

import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ThemeData _theme;
  int _pageIndex = 0;
  late double _width;

  late PageController _pageController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> pages = [
    const HomePage(),
    const CategroyPage(),
    const SearchPage(),
    const FavoritePage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: _theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p8,
              vertical: AppPadding.p8,
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Image.asset(
                      ImageAssets.appLogo,
                      width: _width * 0.12,
                    ),
                    const SizedBox(
                      height: AppSize.s1,
                    ),
                    Text(
                      Constants.appName,
                      //style: _theme.textTheme.caption,
                    ),
                  ],
                ),
              ],
            ),
          ),
          centerTitle: false,
          titleSpacing: 10,
          backgroundColor: ColorManager.secondary,
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p8,
                vertical: AppPadding.p8,
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.account_circle,
                  size: AppSize.s40,
                  color: ColorManager.white,
                ),
              ),
            ),
          ],
        ),
        body: PageView(
          children: pages,
          onPageChanged: onPageChange,
          controller: _pageController,
        ),
        bottomNavigationBar: _bottomNavigatonBar(),
      ),
    );
  }

  /// [page] current page
  //When page is Changed
  void onPageChange(int page) {
    setState(() {
      _pageIndex = page;
    });
  }

  /// [index] current page index
  void onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }

  Widget _bottomNavigatonBar() {
    return BottomNavigationBar(
      currentIndex: _pageIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onTabTapped,
      showUnselectedLabels: true,
      selectedItemColor: ColorManager.white,
      unselectedItemColor: ColorManager.grey2.withOpacity(0.7),
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard,
          ),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
          ),
          label: 'Favorite',
        ),
      ],
    );
  }
}
