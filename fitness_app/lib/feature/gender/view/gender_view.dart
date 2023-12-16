import 'package:auto_route/auto_route.dart';
import 'package:fistness_app_firebase/core/navigator/app_router.dart';
import 'package:fistness_app_firebase/core/navigator/manager/auto_route_manager.dart';
import 'package:fistness_app_firebase/feature/gender/cubit/gender_cubit.dart';
import 'package:fistness_app_firebase/feature/gender/cubit/gender_state.dart';
import 'package:fistness_app_firebase/feature/gender/params/gender_params.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../product/const/const_shelf.dart';
import '../../../product/theme/colors.dart';
import '../../../product/widget/appBar/custom_app_bar.dart';
import '../../views_shelf.dart';
part '../widget/gender_widget.dart';

@RoutePage()
class GenderView extends StatelessWidget {
  final GenderParams params;
  const GenderView({Key? key, required this.params}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenderCubit(),
      child: Scaffold(
        appBar: const CommonAppBar(),
        body: Padding(
          padding: const AppPadding.lowHorizontal(),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const LogoBody(),
                  CustomSize.minHeight(),
                  const ConstText(text: QuestionsText.sexText),
                  CustomSize.xLargeHeight(),
                  const _ToggleGenderButtons(),
                  CustomSize.xxLargeHeight(),
                  _NextButton(params: params)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
