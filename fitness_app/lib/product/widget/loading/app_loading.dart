import 'package:flutter/material.dart';

import '../../enum/image/lottie/logo_path.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: LottiePath.lottie_loading.toLottie(context));
  }
}
