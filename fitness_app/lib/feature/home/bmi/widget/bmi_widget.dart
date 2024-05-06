part of '../view/bmi_view.dart';

class BmiWidget extends StatelessWidget {
  const BmiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GlobalCubit, GlobalState, UserModel?>(
      selector: (state) => state.user,
      builder: (context, user) {
        final int height = user?.height ?? 0;
        final int weight = user?.weight ?? 0;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bmiGauge(
              context: context,
              result: GlobalService().calculateBmi(
                height: height,
                weight: weight,
              ),
            ),
            CustomSize.xLargeHeight(),
            _BmiInfoField(title: "Height:", text: height.toString()),
            CustomSize.largeHeight(),
            _BmiInfoField(title: "Weight:", text: weight.toString()),
            CustomSize.largeHeight(),
            _BmiInfoField(
              title: "BMI Result:",
              text: GlobalService().calculateBmi(
                height: height,
                weight: weight,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BmiInfoField extends StatelessWidget {
  final String title;
  final String text;
  const _BmiInfoField({required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: commonBoxDecoration(
            AppColors.black, AppColors.mainPrimary, AppColors.keyTextShadowColor),
        height: 48.h,
        padding: const AppPadding.normalAll(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: context.textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            Text(
              text,
              style: context.textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
