part of '../view/gender_view.dart';

class _ToggleGenderButtons extends StatelessWidget {
  const _ToggleGenderButtons();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GenderCubit, GenderState, List<bool>>(
      selector: (state) => state.isSelectedList,
      builder: (context, isSelectedList) {
        return ToggleButtons(
          borderRadius: BorderRadius.circular(16.0),
          isSelected: isSelectedList,
          onPressed: (index) => context.read<GenderCubit>().toggleOnPressed(index),
          color: AppColors.darkText,
          children: const [
            _MaleField(),
            _FemaleField(),
          ],
        );
      },
    );
  }
}

class _MaleField extends StatelessWidget {
  const _MaleField();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(Icons.male, size: 130.w, color: context.read<GenderCubit>().maleIconColor),
        Text(
          LocaleKeys.Auth_manText,
          style: context.textTheme.titleSmall
              ?.copyWith(color: context.read<GenderCubit>().maleTextColor),
        ).tr()
      ],
    );
  }
}

class _FemaleField extends StatelessWidget {
  const _FemaleField();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.female, size: 130.w, color: context.read<GenderCubit>().femaleIconColor),
        Text(
          LocaleKeys.Auth_womanText,
          style: context.textTheme.titleSmall
              ?.copyWith(color: context.read<GenderCubit>().femaleTextColor),
        ).tr()
      ],
    );
  }
}

class _NextButton extends StatelessWidget {
  final GenderParams params;

  const _NextButton({required this.params});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GenderCubit, GenderState, String?>(
      selector: (state) => state.selectedGender,
      builder: (context, selectedGender) {
        return CommonButton(
          text: LocaleKeys.continueText,
          onPressed: () => RouteManager.instance.push(
            AgeRoute(
              params: AgeParams(
                mail: params.mail,
                username: params.username,
                password: params.password,
                name: params.name,
                gender: selectedGender,
              ),
            ),
          ),
        );
      },
    );
  }
}
