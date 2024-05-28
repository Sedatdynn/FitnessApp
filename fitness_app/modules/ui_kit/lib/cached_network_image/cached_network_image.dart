import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget errorWidget;

  const CachedNetworkImageWidget({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    required this.errorWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: fit,
        cacheKey: imageUrl,
        imageUrl: imageUrl,
        placeholder: (context, url) => const LoadingCircularWidget(),
        errorWidget: (context, url, error) => errorWidget,
      ),
    );
  }
}
