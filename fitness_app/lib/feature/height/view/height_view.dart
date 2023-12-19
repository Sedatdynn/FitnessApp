import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/height/cubit/height_cubit.dart';
import 'package:fistness_app_firebase/feature/height/cubit/height_state.dart';
import 'package:fistness_app_firebase/feature/height/params/height_params.dart';
import 'package:fistness_app_firebase/feature/weight/params/weight_params.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/widget/numberPicker/number_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/const/const_shelf.dart';
import '../../../product/widget/appBar/custom_app_bar.dart';
import '../../views_shelf.dart';

part '../widget/height_widget.dart';

@RoutePage()
class HeightView extends StatelessWidget {
  final HeightParams params;
  const HeightView({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HeightCubit(),
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: Padding(
          padding: const AppPadding.lowHorizontal(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoBody(),
                const RegisterInfoQuestionText(text: QuestionsText.heightText),
                CustomSize.xxLargeHeight(),
                const _HeightNumberPickerWidget(),
                CustomSize.xxLargeHeight(),
                CustomSize.xxLargeHeight(),
                _NextButton(params: params),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const int minValue = 140;
const int maxValue = 220;
