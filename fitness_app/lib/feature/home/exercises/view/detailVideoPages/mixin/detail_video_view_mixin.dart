import 'package:fistness_app_firebase/feature/home/exercises/view/detailVideoPages/detail_video_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

mixin DetailVideoViewMixin on State<DetailVideoView> {
  late YoutubePlayerController youtubeController;
  late VideoPlayerController videoController;
  String url = "";
  late bool checkUrl;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    checkVideoType();
    _playNormalVideo();
    _playYoutubeVideo();
  }

  void _playNormalVideo() {
    videoController = VideoPlayerController.networkUrl(Uri.parse(url))
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => videoController.play());
  }

  void _playYoutubeVideo() {
    youtubeController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url) ?? "",
        flags: const YoutubePlayerFlags(mute: true, autoPlay: false));
  }

  void checkVideoType() {
    url = widget.items.videoUrl.toString();
    checkUrl = url.contains("youtube");
  }

  @override
  void dispose() {
    videoController.dispose();
    youtubeController.dispose();
    super.dispose();
  }
}
