part of '../view/bmi_view.dart';

class BmiWidget extends StatelessWidget {
  const BmiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GlobalCubit, GlobalState, UserModel?>(
      selector: (state) => state.user,
      builder: (context, user) {
        final height = user?.height ?? 0;
        final weight = user?.weight ?? 0;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BmiGaugeWidget(),
            CustomSize.xLargeHeight(),
            _BmiInfoField(title: 'Height:', text: height.toString()),
            CustomSize.largeHeight(),
            _BmiInfoField(title: 'Weight:', text: weight.toString()),
            CustomSize.largeHeight(),
            _BmiInfoField(
              title: 'BMI Result:',
              text: GlobalService().calculateBmi(user: user!),
            ),
          ],
        );
      },
    );
  }
}

class _BmiInfoField extends StatelessWidget {
  const _BmiInfoField({required this.title, required this.text});
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: commonBoxDecoration(
        AppColors.black,
        AppColors.mainPrimary,
        AppColors.keyTextShadowColor,
      ),
      height: 48.h,
      padding: const AppPadding.normalAll(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BmiTextWidget(text: title),
          _BmiTextWidget(text: text),
        ],
      ),
    );
  }
}

class _BmiTextWidget extends StatelessWidget {
  const _BmiTextWidget({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textTheme.titleSmall,
      textAlign: TextAlign.center,
    );
  }
}
