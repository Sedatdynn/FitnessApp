part of '../view/age_view.dart';

class _YearNumberPicker extends StatelessWidget {
  const _YearNumberPicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgeCubit, AgeState>(
      builder: (context, state) {
        return NumberPicker(
          selectedTextStyle:
              Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.mainPrimary),
          textStyle: Theme.of(context).textTheme.titleSmall,
          decoration: BoxDecoration(
            border: Border(top: customBorder, bottom: customBorder),
          ),
          value: state.birthYear!,
          minValue: state.minValue!,
          maxValue: state.maxValue!,
          onChanged: (value) => context.read<AgeCubit>().setBirthYear(value),
        );
      },
    );
  }

  BorderSide get customBorder => const BorderSide(
        color: Color(0xFFC4FB6D),
        width: 3.0,
      );
}

class _NextButton extends StatelessWidget {
  const _NextButton({required this.params});
  final AgeParams params;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgeCubit, AgeState>(
      builder: (context, state) {
        return CommonButton(
            text: MyText.continueText,
            onPressed: () {
              RouteManager.instance.push(DailyMobilityRoute(
                username: params.username,
                mail: params.mail,
                password: params.password,
                name: params.name,
                gender: params.gender,
                birthYear: state.birthYear,
              ));
            });
      },
    );
  }
}
