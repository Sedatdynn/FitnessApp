import 'package:flutter/material.dart';

/// Circular progress widget to show loading in the middle of the page
class LoadingCircularWidget extends StatelessWidget {
  const LoadingCircularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
