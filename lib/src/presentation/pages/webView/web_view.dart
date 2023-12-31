import 'package:dev_guide/src/presentation/resources/values_manager.dart';
import 'package:dev_guide/src/presentation/widget/back_icon.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebLinkView extends StatelessWidget {
  const WebLinkView({Key? key, this.link}) : super(key: key);
  final link;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(AppPadding.p8),
              child: BackIcon(),
            ),
            Expanded(
              child: WebView(
                initialUrl: link,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
