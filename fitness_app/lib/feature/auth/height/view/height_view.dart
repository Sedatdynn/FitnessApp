import 'package:auto_route/auto_route.dart';
import 'package:core/navigator/manager/auto_route_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/auth/height/height_shelf.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/navigator/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part '../widget/height_widget.dart';

@RoutePage()
class HeightView extends StatelessWidget {
  const HeightView({required this.params, super.key});
  final HeightParams params;

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
                const RegisterInfoQuestionText(text: LocaleKeys.Question_heightText),
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
