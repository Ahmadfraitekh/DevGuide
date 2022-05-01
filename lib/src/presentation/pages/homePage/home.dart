import 'package:carousel_slider/carousel_slider.dart';
import 'package:dev_guide/src/core/routes_name.dart';
import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/image_view.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  // ignore: unused_field
  late double _width;
  late ThemeData _theme;
  int activeIndex = 0;
  final urlImages = [
    'https://miro.medium.com/max/1400/0*E0oXyDylhIc78F2q',
    'https://imgs.abduzeedo.com/files/wallpapers/wpw172/wp_1680.jpg',
    'https://c4.wallpaperflare.com/wallpaper/962/970/355/code-web-development-development-html-wallpaper-preview.jpg',
  ];

  final List<String> textImages = [
    'Find the book you need here ',
    'Focusing is about saying NO.',
    'Create a webpage using HTML',
  ];

  final String booksLink = 'https://books.goalkicker.com/';

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _theme = Theme.of(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: AppSize.s30,
          ),
          _slider(),
          const SizedBox(
            height: AppSize.s20,
          ),
          _course(),
          Divider(
            indent: 10.0,
            endIndent: 10.0,
            color: ColorManager.secondary,
          ),
          _mostRecently(),
          Divider(
            indent: 10.0,
            endIndent: 10.0,
            color: ColorManager.secondary,
          ),
          _popular(),
        ],
      ),
    );
  }

  Widget _course() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Courses',
            style: _theme.textTheme.headline3,
          ),
          const SizedBox(
            height: AppSize.s4,
          ),
          SizedBox(
            height: AppSize.s90,
            child: ListView.builder(
              itemBuilder: (context, index) => _imageView(
                'https://www.filepicker.io/api/file/sXz6u6kMQzK9uXkCwtPv',
              ),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _mostRecently() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Most Recently',
            style: _theme.textTheme.headline3,
          ),
          const SizedBox(
            height: AppSize.s4,
          ),
          SizedBox(
            height: AppSize.s90,
            child: ListView.builder(
              itemBuilder: (context, index) => _imageView(
                'https://www.filepicker.io/api/file/sXz6u6kMQzK9uXkCwtPv',
              ),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _popular() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular',
            style: _theme.textTheme.headline3,
          ),
          const SizedBox(
            height: AppSize.s4,
          ),
          SizedBox(
            height: AppSize.s90,
            child: ListView.builder(
              itemBuilder: (context, index) => _imageView(
                'https://www.filepicker.io/api/file/sXz6u6kMQzK9uXkCwtPv',
              ),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageView(String url) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(
        AppPadding.p8,
      ),
      child: ImageView(
        url: url,
        width: AppSize.s130,
      ),
    );
  }

  Widget _slider() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          color: ColorManager.scaffoldBackgroundColor,
          clipBehavior: Clip.antiAlias,
          elevation: 10.0,
          shadowColor: ColorManager.secondary,
          child: SizedBox(
            height: AppSize.s190,
            width: 400.0,
            child: CarouselSlider.builder(
              itemCount: urlImages.length,
              itemBuilder: (context, index, realIndex) {
                final urlImage = urlImages[index];
                return _buildImage(urlImage, index);
              },
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayInterval: Duration(seconds: 5),
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
              ),
            ),
          ),
        ),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildImage(String urlImage, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 2.0,
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          ImageView(
            url: urlImage,
            height: AppSize.s190,
            width: 400.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p30,
              left: AppPadding.p12,
            ),
            child: _bookView(index),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: AppPadding.p12,
              left: AppPadding.p20,
            ),
            child: Text(
              '${textImages[index]}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorManager.background,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: urlImages.length,
      effect: SwapEffect(
        dotHeight: AppSize.s12,
        dotWidth: AppSize.s12,
        dotColor: ColorManager.secondary,
        activeDotColor: ColorManager.primary,
      ),
    );
  }

  Widget _bookView(int index) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutesName.webView,
              arguments: {'link': booksLink});
        },
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            ListTile(
                trailing: textImages[index] == textImages[0]
                    ? Text(
                        "View",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorManager.white,
                          fontSize: 20.0,
                        ),
                      )
                    : Text('')),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
