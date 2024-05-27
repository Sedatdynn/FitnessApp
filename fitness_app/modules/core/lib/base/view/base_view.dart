// import 'package:core/base/cubit/base_cubit.dart';
// import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
// import 'package:fistness_app_firebase/product/widget/appBar/custom_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BaseViewWithCubit extends StatelessWidget {
//   const BaseViewWithCubit({required this.cubit, super.key, this.child});
//   final Widget? child;
//   final BaseCubit cubit;

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => cubit,
//       child: Scaffold(
//         appBar: const CommonAppBar(),
//         body: Padding(
//           padding: const AppPadding.normalHorizontal(),
//           child: SingleChildScrollView(child: child),
//         ),
//       ),
//     );
//   }
// }
