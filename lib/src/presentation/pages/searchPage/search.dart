import 'package:dev_guide/src/presentation/widget/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            RoundedInputField(
              controller: _searchController,
              icon: Icons.search_outlined,
              hintText: 'Search',
            )
          ],
        ),
      ),
    );
  }
}
