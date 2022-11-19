import 'package:fistness_app_firebase/core/const/const_appbar.dart';
import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:fistness_app_firebase/views/exercises/model/exercises_model.dart';
import 'package:fistness_app_firebase/views/exercises/viewModel/exercises_view_model.dart';
import 'package:fistness_app_firebase/views/service/project_network.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/const/const_deco.dart';
import '../../../service/foods_exercises_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailVideoPage extends StatefulWidget {
  VideoPageData items;
  DetailVideoPage({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<DetailVideoPage> createState() => _DetailVideoPageState();
}

class _DetailVideoPageState extends State<DetailVideoPage> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId(widget.items.videoUrl.toString())!,
        flags: const YoutubePlayerFlags(mute: true, autoPlay: false));
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        String item = "exercises";
        return ExercisesViewModel(
            GeneralService(ProjectNetworkManager.instance.service, item));
      },
      builder: (context, child) {
        return Scaffold(
          body: ListView(children: [
            Stack(
              children: [
                _videoPlayer(),
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
            Container(
              decoration: commonBoxDec(context.scfBackColor,
                  context.scfBackColor, context.scfBackColor),
              child: ListView.builder(
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
              ),
            )
          ]),
        );
      },
    );
  }

  Container _instrctTitle(BuildContext context) {
    return Container(
      margin: context.minsymVertHorzPadding,
      alignment: Alignment.center,
      height: context.height * 0.05,
      child: Text(
        widget.items.secondTitle.toString(),
        style: context.subtitle1(context),
      ),
    );
  }

  Container _overviewContent(BuildContext context) {
    return Container(
      margin: context.minsymVertHorzPadding,
      alignment: Alignment.center,
      child: Text(
        widget.items.firstContent.toString(),
        style: context.subtitle1(context),
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
        style: context.subtitle1(context),
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
        "Video ilk baslik",
        style: context.subtitle1(context)?.copyWith(
            fontWeight: FontWeight.bold, color: context.scfBackColor),
      ),
    );
  }
}
