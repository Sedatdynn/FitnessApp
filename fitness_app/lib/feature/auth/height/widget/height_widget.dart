part of '../view/height_view.dart';

class _HeightNumberPickerWidget extends StatelessWidget {
  const _HeightNumberPickerWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HeightCubit, HeightState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomNumberPicker(
              value: state.selectedValue!,
              minValue: minValue,
              maxValue: maxValue,
              onChanged: (value) => context.read<HeightCubit>().setSelectedValue(value),
            ),
            Text(RegisterText.cmText, style: context.textTheme.titleSmall),
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
          text: MyText.nextText,
          onPressed: () => RouteManager.instance.push(WeightRoute(
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
          )),
        );
      },
    );
  }
}
