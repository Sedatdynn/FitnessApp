import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/feature/weight/cubit/weight_cubit.dart';
import 'package:fistness_app_firebase/feature/weight/cubit/weight_state.dart';
import 'package:fistness_app_firebase/feature/weight/params/calculate_func_params.dart';
import 'package:fistness_app_firebase/feature/weight/params/weight_params.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/widget/numberPicker/number_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../product/const/const_shelf.dart';
import '../../../product/widget/appBar/custom_app_bar.dart';
import '../../views_shelf.dart';
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
