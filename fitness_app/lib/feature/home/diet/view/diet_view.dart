import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/home/diet/cubit/diet_cubit.dart';
import 'package:fistness_app_firebase/feature/home/diet/cubit/diet_state.dart';
import 'package:fistness_app_firebase/feature/home/diet/model/foods_model.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/language/locale_keys.g.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/global/global_shelf.dart';
import 'package:fistness_app_firebase/product/product_shelf.dart';
import 'package:fistness_app_firebase/product/widget/button/common_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widget/diet_widget.dart';

@RoutePage()
class DietView extends StatelessWidget {
  const DietView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DietCubit(),
      child: const Scaffold(
        body: _ScrollBodyWidget(),
      ),
    );
  }
}

class _ScrollBodyWidget extends StatelessWidget {
  const _ScrollBodyWidget();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        _CustomSliverAppBar(),
        SliverPadding(
          padding: AppPadding.minAll(),
        ),
        _MainSliverListBody(),
      ],
    );
  }
}
