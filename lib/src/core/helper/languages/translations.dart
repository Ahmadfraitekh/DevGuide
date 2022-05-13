import 'package:dev_guide/src/core/helper/languages/ar.dart';
import 'package:dev_guide/src/core/helper/languages/en.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': en,
        'ar': ar,
      };
}
