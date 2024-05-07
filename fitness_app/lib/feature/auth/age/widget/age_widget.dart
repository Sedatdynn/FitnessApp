part of '../view/age_view.dart';

class _YearNumberPicker extends StatelessWidget {
  const _YearNumberPicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgeCubit, AgeState>(
      builder: (context, state) {
        return CustomNumberPicker(
          value: state.birthYear!,
          minValue: state.minValue!,
          maxValue: state.maxValue!,
          onChanged: (value) => context.read<AgeCubit>().setBirthYear(value),
        );
      },
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({required this.params});
  final AgeParams params;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgeCubit, AgeState>(
      builder: (context, state) {
        return CommonButton(
          text: LocaleKeys.continueText.tr(),
          onPressed: () => RouteManager.instance.push(
            DailyMobilityRoute(
              params: MobilityParams(
                username: params.username,
                mail: params.mail,
                password: params.password,
                name: params.name,
                gender: params.gender,
                birthYear: state.birthYear,
              ),
            ),
          ),
        );
      },
    );
  }
}
