import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/feature/auth/weight/cubit/weight_cubit.dart';
import 'package:fistness_app_firebase/feature/auth/weight/cubit/weight_state.dart';
import 'package:fistness_app_firebase/feature/auth/weight/params/calculate_func_params.dart';
import 'package:fistness_app_firebase/feature/auth/weight/params/weight_params.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/product/const/register_info_text.dart';

import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/widget/appBar/custom_app_bar.dart';
import 'package:fistness_app_firebase/product/widget/button/common_button.dart';
import 'package:fistness_app_firebase/product/widget/logo/logo.dart';
import 'package:fistness_app_firebase/product/widget/numberPicker/number_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../widget/weight_widget.dart';

@RoutePage()
class WeightView extends StatelessWidget {
  final WeightParams params;

  const WeightView({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeightCubit(),
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: Padding(
          padding: const AppPadding.minAll(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoBody(),
                CustomSize.xxLargeHeight(),
                const RegisterInfoQuestionText(text: QuestionsText.weightText),
                CustomSize.xxLargeHeight(),
                const _WeightNumberPicker(),
                // if (isLoading) const LoadingPage(),
                CustomSize.xxLargeHeight(),
                CustomSize.xxLargeHeight(),
                _CompleteButton(params: params)
              ],
            ),
          ),
        ),
      ),
    );
  }
}