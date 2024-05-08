part of '../view/edit_profile_view.dart';

class _DropDownWidget extends StatelessWidget {
  const _DropDownWidget();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GlobalCubit, GlobalState, UserModel?>(
      selector: (state) => state.user,
      builder: (context, user) {
        return DropdownButton<String>(
          hint: const Center(child: Text('select')),
          dropdownColor: Colors.deepPurpleAccent,
          isExpanded: true,
          value: user?.mobility,
          style: context.textTheme.titleSmall,
          underline: Container(height: 2.h, color: Colors.deepPurpleAccent),
          onChanged: (String? value) => context.read<GlobalCubit>().updateUserMobility(value!),
          items: GlobalService.items.map(_dropdownMenuItem).toList(),
        );
      },
    );
  }

  DropdownMenuItem<String> _dropdownMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Center(child: Text(item)));
}

class _HeightWeightTextField extends StatelessWidget {
  const _HeightWeightTextField({
    required this.onChanged,
    required this.hintText,
    required this.icon,
  });
  final void Function(String)? onChanged;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      style: context.textTheme.titleSmall,
      cursorColor: AppColors.whiteText,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: AppColors.mainPrimary),
        hintText: hintText,
        hintStyle: context.textTheme.bodyLarge,
      ),
    );
  }
}
