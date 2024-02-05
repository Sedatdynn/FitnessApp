import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailVideoShimmer extends StatelessWidget {
  const DetailVideoShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: AppColors.mainPrimary,
        child: Container(
          decoration:
              BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(12)),
          width: double.infinity,
          height: 250,
        ));
  }
}
