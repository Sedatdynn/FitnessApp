part of '../view/bmi_view.dart';

class BmiWidget extends StatelessWidget {
  final double width;
  final String userHeight;
  final String userWeight;
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
            bmiCalculate(context.watch<GlobalCubit>().user.height!,
                context.watch<GlobalCubit>().user.weight!)),
        CustomSize.xLargeHeight(),
        _BmiInfoField(title: "Height:", text: userHeight),
        CustomSize.largeHeight(),
        _BmiInfoField(title: "Weight:", text: userWeight),
        CustomSize.largeHeight(),
        _BmiInfoField(
            title: "BMI Result:",
            text: bmiCalculate(context.watch<GlobalCubit>().user.height!,
                context.watch<GlobalCubit>().user.weight!)),
      ],
    );
  }

  String bmiCalculate(String height, String weight) {
    double result = int.parse(weight) / (int.parse(height) * int.parse(height) / 10000);
    String bmi = result.toStringAsFixed(2);
    return bmi;
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
