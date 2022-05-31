import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeViewModel extends GetxController {
  late YoutubePlayerController ytController;

  @override
  void onInit() {
    super.onInit();

    ytController = YoutubePlayerController(
      initialVideoId: 'LfkBOKwsTc0',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }
}
