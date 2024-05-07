part of '../view/height_view.dart';

class _HeightNumberPickerWidget extends StatelessWidget {
  const _HeightNumberPickerWidget();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HeightCubit, HeightState, int>(
      selector: (state) => state.selectedValue!,
      builder: (context, selectedValue) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomNumberPicker(
              value: selectedValue,
              minValue: minValue,
              maxValue: maxValue,
              onChanged: (value) => context.read<HeightCubit>().setSelectedValue(value),
            ),
            Text(LocaleKeys.Auth_cmText.tr(), style: context.textTheme.titleSmall),
          ],
        );
      },
    );
  }
}

class _NextButton extends StatelessWidget {
  const _NextButton({required this.params});
  final HeightParams params;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeightCubit, HeightState>(
      builder: (context, state) {
        return CommonButton(
          text: LocaleKeys.nextText.tr(),
          onPressed: () => RouteManager.instance.push(
            WeightRoute(
              params: WeightParams(
                username: params.username,
                mail: params.mail,
                password: params.password,
                name: params.name,
                gender: params.gender,
                birthYear: params.birthYear,
                mobility: params.mobility,
                height: state.selectedValue,
              ),
            ),
          ),
        );
      },
    );
  }
}

const int minValue = 140;
const int maxValue = 220;
