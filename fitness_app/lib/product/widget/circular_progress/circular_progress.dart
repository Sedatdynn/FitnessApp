import 'package:flutter/material.dart';

class LoadingCircularWidget extends StatelessWidget {
  const LoadingCircularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
