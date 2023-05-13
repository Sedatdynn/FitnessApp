import 'package:fistness_app_firebase/feature/service/foods_service.dart';

import '../../../../product/theme/colors.dart';
import 'video_player_widget.dart';
import '../../../../product/extensions/extensions_shelf.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/init/network/project_network.dart';
import '../../model/exercises_model.dart';
import '../../viewModel/exercises_view_model.dart';

class DetailVideoPage extends StatefulWidget {
  final VideoPageData items;
  const DetailVideoPage({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<DetailVideoPage> createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {
  final String titleText = 'Exercise Information';
  late YoutubePlayerController _controller;
  late VideoPlayerController videoController;
  int currentIndex = 0;
  String url = "";
  late bool checkUrl;

  @override
  void initState() {
    super.initState();
    checkVideoType();
    _playNormalVideo();
    _playYoutubeVideo();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        String item = "exercises";
        return ExercisesViewModel(
            FoodsService(ProjectNetworkManager.instance.service, item));
      },
      builder: (context, child) {
        return Scaffold(
          body: ListView(children: [
            Stack(
              children: [
                Column(children: [
                  checkUrl
                      ? _videoPlayer()
                      : VideoPlayerWidget(controller: videoController)
                ]),
                Positioned(
                  top: 0,
                  left: 0,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.chevron_left_outlined)),
                ),
              ],
            ),
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext ctxt, int i) {
                return Container(
                  margin: context.minAllPadding,
                  decoration: const BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(8.0),
                      bottomLeft: Radius.circular(16.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      _titleText(context),
                      _overviewTextTitle(context),
                      _overviewContent(context),
                      _instrctTitle(context),
                    ],
                  ),
                );
              },
            )
          ]),
        );
      },
    );
  }

  void _playNormalVideo() {
    videoController = VideoPlayerController.network(url)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => videoController.play());
  }

  void _playYoutubeVideo() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url) ?? "",
        flags: const YoutubePlayerFlags(mute: true, autoPlay: false));
  }

  void checkVideoType() {
    url = widget.items.videoUrl.toString();
    checkUrl = url.contains("youtube");
  }

  Container _instrctTitle(BuildContext context) {
    return Container(
      margin: context.minsymVertHorzPadding,
      alignment: Alignment.center,
      height: context.height * 0.05,
      child: Text(
        widget.items.secondTitle.toString(),
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Container _overviewContent(BuildContext context) {
    return Container(
      margin: context.minsymVertHorzPadding,
      alignment: Alignment.center,
      child: Text(
        widget.items.firstContent.toString(),
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Container _overviewTextTitle(BuildContext context) {
    return Container(
      margin: context.minsymVertHorzPadding,
      alignment: Alignment.center,
      height: context.height * 0.05,
      child: Text(
        widget.items.firstTitle.toString(),
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  YoutubePlayer _videoPlayer() {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      onReady: () {},
      bottomActions: [
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
          colors: const ProgressBarColors(
              bufferedColor: Colors.red,
              playedColor: Colors.purple,
              handleColor: Colors.green),
        ),
        const PlaybackSpeedButton(),
        FullScreenButton(),
        RemainingDuration()
      ],
    );
  }

  Container _titleText(BuildContext context) {
    return Container(
      margin: context.minsymVertHorzPadding,
      alignment: Alignment.centerLeft,
      height: context.height * 0.05,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold, color: AppColors.backgroundColor),
      ),
    );
  }
}
