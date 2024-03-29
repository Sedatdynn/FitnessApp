part of '../view/weight_view.dart';

class _WeightNumberPicker extends StatelessWidget {
  const _WeightNumberPicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightCubit, WeightState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomNumberPicker(
              value: state.selectedValue!,
              minValue: 30,
              maxValue: 200,
              onChanged: (value) => context.read<WeightCubit>().setSelectedValue(value),
            ),
            Text(RegisterText.kgText, style: context.textTheme.titleSmall)
          ],
        );
      },
    );
  }
}

class _CompleteButton extends StatelessWidget {
  final WeightParams params;

  const _CompleteButton({required this.params});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeightCubit, WeightState>(
      builder: (context, state) {
        return CommonButton(
          text: MyText.complete,
          onPressed: () async {
            await context
                .read<WeightCubit>()
                .calculateTotalPoints(
                  params: UserModel(
                      age: params.birthYear!,
                      gender: params.gender!,
                      height: params.height!,
                      weight: state.selectedValue,
                      mobility: params.mobility!),
                )
                .then((_) => {
                      context.read<WeightCubit>().createPerson(
                          params: params,
                          function: () async {
                            await warningToast(RegisterText.registerSuccessfully,
                                color: AppColors.green);
                            await warningToast(RegisterText.verifyWarning, color: AppColors.green);
                          })
                    });
          },
        );
      },
    );
  }
}
