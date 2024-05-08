import 'package:fistness_app_firebase/feature/home/exercises/shimmer/detail_video_shimmer.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({required this.controller, super.key});
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) => controller.value.isInitialized
      ? SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  _PlayPauseButton(controller: controller),
                  Expanded(
                    child:
                        SizedBox(height: 20.h, child: _VideoProgressWidget(controller: controller)),
                  ),
                ],
              ),
            ],
          ),
        )
      : const DetailVideoShimmer();
}

class _PlayPauseButton extends StatelessWidget {
  const _PlayPauseButton({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => controller.value.isPlaying ? controller.pause() : controller.play(),
      icon: Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
    );
  }
}

class _VideoProgressWidget extends StatelessWidget {
  const _VideoProgressWidget({required this.controller});
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return VideoProgressIndicator(
      controller,
      allowScrubbing: true,
      padding: const AppPadding.minAll(),
    );
  }
}
