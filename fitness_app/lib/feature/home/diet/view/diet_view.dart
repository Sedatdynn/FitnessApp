import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/home/diet/cubit/diet_cubit.dart';
import 'package:fistness_app_firebase/feature/home/diet/cubit/diet_state.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/language/locale_keys.g.dart';
import 'package:fistness_app_firebase/product/const/responsive/paddings.dart';
import 'package:fistness_app_firebase/product/const/responsive/responsive.dart';
import 'package:fistness_app_firebase/product/const/responsive/space.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_cubit.dart';
import 'package:fistness_app_firebase/product/global/cubit/global_state.dart';
import 'package:fistness_app_firebase/product/theme/colors.dart';
import 'package:fistness_app_firebase/product/widget/button/common_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/foods_model.dart';
part '../widget/diet_widget.dart';

@RoutePage()
class DietView extends StatelessWidget {
  const DietView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DietCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(100.h), child: const _TopInfoWidget())),
          body: const _ScrollBodyWidget(),
        ),
      ),
    );
  }
}

class _ScrollBodyWidget extends StatelessWidget {
  const _ScrollBodyWidget();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const AppPadding.minAll(),
        child: Column(
          children: [
            const _MainListViewBody(),
            CustomSize.largeHeight(),
          ],
        ),
      ),
    );
  }
}
