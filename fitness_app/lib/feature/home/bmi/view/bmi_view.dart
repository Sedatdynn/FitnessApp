import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fistness_app_firebase/feature/home/bmi/widget/bmi_gauge.dart';
import 'package:fistness_app_firebase/feature/views_shelf.dart';
import 'package:fistness_app_firebase/language/locale_keys.g.dart';
import 'package:fistness_app_firebase/product/const/const_shelf.dart';
import 'package:fistness_app_firebase/product/global/global_shelf.dart';
import 'package:fistness_app_firebase/product/product_shelf.dart';
import 'package:fistness_app_firebase/product/widget/widgets_shelf.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part '../widget/bmi_widget.dart';

@RoutePage()
class BmiCalculatorView extends StatelessWidget {
  const BmiCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CommonAppBar(),
      body: Padding(
        padding: AppPadding.normalAll(),
        child: BmiWidget(),
      ),
    );
  }
}
