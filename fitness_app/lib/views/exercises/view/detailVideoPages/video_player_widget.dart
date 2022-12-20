import 'package:fistness_app_firebase/core/extensions/extensions_shelf.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  const VideoPlayerWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) => controller.value.isInitialized
      ? Column(
          children: [
            Container(
              height: 200,
              alignment: Alignment.topCenter,
              child: buildVideo(),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [buildPlayButton(), buildVideoIndicator(context)],
            )
          ],
        )
      : const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()),
        );

  Expanded buildVideoIndicator(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 20,
        child: VideoProgressIndicator(
          controller,
          allowScrubbing: true,
          padding: context.minAllPadding,
        ),
      ),
    );
  }

  IconButton buildPlayButton() {
    return IconButton(
        onPressed: () =>
            controller.value.isPlaying ? controller.pause() : controller.play(),
        icon:
            Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow));
  }

  Widget buildVideo() => buildVideoPlayer();

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: VideoPlayer(controller));
}
