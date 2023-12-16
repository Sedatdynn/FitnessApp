import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/age/cubit/age_cubit.dart';
import 'package:fistness_app_firebase/feature/age/cubit/age_state.dart';

import 'package:fistness_app_firebase/feature/age/params/age_params.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../product/const/const_shelf.dart';
import '../../../product/theme/colors.dart';
import '../../../product/widget/appBar/custom_app_bar.dart';
import '../../views_shelf.dart';
part '../widget/age_widget.dart';

@RoutePage()
class AgeView extends StatelessWidget {
  final AgeParams params;
  const AgeView({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AgeCubit(),
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: Padding(
          padding: const AppPadding.lowHorizontal(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const LogoBody(),
                CustomSize.xxLargeHeight(),
                Text(QuestionsText.ageText, style: Theme.of(context).textTheme.titleLarge),
                CustomSize.xxLargeHeight(),
                const _YearNumberPicker(),
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
