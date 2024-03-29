import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/widget/warning/warning_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../product/const/register_info_text.dart';
import '../../../../product/const/responsive/paddings.dart';
import '../../../../product/const/responsive/responsive.dart';
import '../../../../product/const/responsive/space.dart';
import '../../../../product/models/user_model.dart';
import '../../../../product/widget/appBar/custom_app_bar.dart';
import '../../../../product/widget/button/common_button.dart';
import '../../../../product/widget/logo/logo.dart';
import '../../../../product/widget/numberPicker/number_picker.dart';
import '../../../views_shelf.dart';
import '../cubit/weight_cubit.dart';
import '../cubit/weight_state.dart';
import '../params/weight_params.dart';

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
