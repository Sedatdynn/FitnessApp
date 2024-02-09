import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/home/exercises/view/detailVideoPages/mixin/detail_video_view_mixin.dart';
import 'package:fistness_app_firebase/feature/home/exercises/view/detailVideoPages/video_player_widget.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../model/exercises_model.dart';

@RoutePage()
class DetailVideoView extends StatefulWidget {
  final VideoPageData items;
  const DetailVideoView({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<DetailVideoView> createState() => _DetailVideoViewState();
}

class _DetailVideoViewState extends State<DetailVideoView> with DetailVideoViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Stack(
          children: [
            Column(children: [
              checkUrl
                  ? _YoutubeVideoWidget(youtubeController: youtubeController)
                  : VideoPlayerWidget(controller: videoController)
            ]),
            const _BackButton(),
          ],
        ),
        Container(
          margin: const AppPadding.minAll(),
          decoration: _detailContainerDecoration(),
          child: Column(
            children: [
              _DetailInfoContainer(text: widget.items.firstTitle.toString()),
              _DetailInfoContainer(text: widget.items.firstContent.toString()),
            ],
          ),
        )
      ]),
    );
  }

  BoxDecoration _detailContainerDecoration() {
    return const BoxDecoration(
      color: AppColors.mainPrimary,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(8.0),
        bottomLeft: Radius.circular(16.0),
      ),
    );
  }
}

class _YoutubeVideoWidget extends StatelessWidget {
  const _YoutubeVideoWidget({required this.youtubeController});

  final YoutubePlayerController youtubeController;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: youtubeController,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      onReady: () {},
      bottomActions: [
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
          colors: const ProgressBarColors(
              bufferedColor: Colors.red, playedColor: Colors.purple, handleColor: Colors.green),
        ),
        const PlaybackSpeedButton(),
        FullScreenButton(),
        RemainingDuration()
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: IconButton(
          onPressed: () => RouteManager.instance.pop(),
          icon: const Icon(Icons.chevron_left_outlined)),
    );
  }
}

class _DetailInfoContainer extends StatelessWidget {
  const _DetailInfoContainer({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const AppPadding.lowSymmetricHorVer(),
      alignment: Alignment.center,
      child: Text(
        text,
        style: context.textTheme.titleSmall?.copyWith(color: AppColors.textColor),
      ),
    );
  }
}
