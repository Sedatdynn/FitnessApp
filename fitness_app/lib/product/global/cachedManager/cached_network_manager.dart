import 'package:cached_network_image/cached_network_image.dart';
import 'package:fistness_app_firebase/product/enum/image/png/image_path.dart';
import 'package:flutter/material.dart';

class CachedNetworkManager {
  static CachedNetworkManager? _instance;
  CachedNetworkManager._init();

  static CachedNetworkManager? get instance {
    _instance ??= CachedNetworkManager._init();
    return _instance;
  }

  Widget cachedNetworkImage({
    required String imageUrl,
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        cacheKey: imageUrl,
        imageUrl: imageUrl,
        placeholder: (context, url) => const Center(child: CircularProgressIndicator.adaptive()),
        errorWidget: (context, url, error) => ImagePath.logo.toPng(),
      ),
    );
  }
}
