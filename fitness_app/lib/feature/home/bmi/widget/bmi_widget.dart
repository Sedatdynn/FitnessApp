part of '../view/bmi_view.dart';

class BmiWidget extends StatelessWidget {
  final double width;
  final int userHeight;
  final int userWeight;
  const BmiWidget(
      {Key? key, required this.width, required this.userHeight, required this.userWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        bmiGauge(
          context,
          GlobalService().calculateBmi(
              height: context.watch<GlobalCubit>().user.height ?? 0,
              weight: context.watch<GlobalCubit>().user.weight ?? 0),
        ),
        CustomSize.xLargeHeight(),
        _BmiInfoField(title: "Height:", text: userHeight.toString()),
        CustomSize.largeHeight(),
        _BmiInfoField(title: "Weight:", text: userWeight.toString()),
        CustomSize.largeHeight(),
        _BmiInfoField(
          title: "BMI Result:",
          text: GlobalService().calculateBmi(
              height: context.watch<GlobalCubit>().user.height ?? 0,
              weight: context.watch<GlobalCubit>().user.weight ?? 0),
        ),
      ],
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
