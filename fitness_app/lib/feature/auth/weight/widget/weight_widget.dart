part of '../view/weight_view.dart';

class _WeightNumberPicker extends StatelessWidget {
  const _WeightNumberPicker();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WeightCubit, WeightState, int?>(
      selector: (state) => state.selectedValue,
      builder: (context, number) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomNumberPicker(
              value: number!,
              minValue: 30,
              maxValue: 200,
              onChanged: (value) => context.read<WeightCubit>().setSelectedValue(value),
            ),
            Text(LocaleKeys.Auth_kgText, style: context.textTheme.titleSmall).tr(),
          ],
        );
      },
    );
  }
}

class _CompleteButton extends StatelessWidget {
  const _CompleteButton({required this.params});
  final WeightParams params;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<WeightCubit, WeightState, int?>(
      selector: (state) => state.selectedValue,
      builder: (context, number) {
        return CommonButton(
          text: LocaleKeys.complete.tr(),
          onPressed: () async {
            await context
                .read<WeightCubit>()
                .calculateTotalPoints(
                  params: UserModel(
                    age: params.birthYear,
                    gender: params.gender,
                    height: params.height,
                    weight: number,
                    mobility: params.mobility,
                  ),
                )
                .then(
                  (_) => {
                    context.read<WeightCubit>().createPerson(
                          params: params,
                          function: () async {
                            await warningToast(
                              LocaleKeys.Auth_registerSuccessfully.tr(),
                              color: AppColors.green,
                            );
                            await warningToast(
                              LocaleKeys.Auth_verifyWarning.tr(),
                              color: AppColors.green,
                            );
                          },
                        ),
                  },
                );
          },
        );
      },
    );
  }
}
