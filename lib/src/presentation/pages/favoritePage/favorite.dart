import 'package:dev_guide/src/presentation/resources/color_manager.dart';
import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/image_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FavoritePage extends StatelessWidget {
  FavoritePage({Key? key}) : super(key: key);

  // CourseModel course;
  late ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: ListView(
          children: [
            ListTile(
              leading: ImageView(
                url:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4iodUjOkdyguyYH3m8V-csm774JJwSpbomA&usqp=CAU',
                height: AppSize.s40,
                width: AppSize.s40,
              ),
              title: Text(
                'HTML',
                style: _theme.textTheme.headline6,
              ),
              subtitle: Text(
                'HTML (HyperText Markup Language) is the most basic building block of the Web. It defines the meaning and structure of web content. Other technologies besides HTML are generally used to describe a web page\'s',
                overflow: TextOverflow.ellipsis,
                style: _theme.textTheme.labelSmall,
              ),
              trailing: Icon(
                Icons.favorite,
                color: ColorManager.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
