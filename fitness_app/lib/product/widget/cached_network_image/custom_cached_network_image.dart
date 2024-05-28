import 'package:fistness_app_firebase/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_kit/ui_kit.dart';

/// calling cached network image from ui_kit module and set error widget
class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({required this.imageUrl, this.width, super.key});
  final String imageUrl;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImageWidget(
      imageUrl: imageUrl,
      errorWidget: Assets.png.logo.image(),
      width: width,
    );
  }
}
