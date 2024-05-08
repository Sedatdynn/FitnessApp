import 'package:cached_network_image/cached_network_image.dart';
import 'package:fistness_app_firebase/gen/assets.gen.dart';
import 'package:fistness_app_firebase/product/widget/circular_progress/circular_progress.dart';
import 'package:flutter/material.dart';

class CachedNetworkManager {
  CachedNetworkManager._init();
  static CachedNetworkManager? _instance;

  static CachedNetworkManager? get instance {
    return _instance ??= CachedNetworkManager._init();
  }

  Widget cachedNetworkImage({
    required String imageUrl,
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        cacheKey: imageUrl,
        imageUrl: imageUrl,
        placeholder: (context, url) => const LoadingCircularWidget(),
        errorWidget: (context, url, error) => Assets.png.logo.image(),
      ),
    );
  }
}
