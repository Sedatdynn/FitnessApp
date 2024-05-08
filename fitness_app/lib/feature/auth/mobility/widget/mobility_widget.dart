part of '../view/mobility_view.dart';

class _DropDownWidget extends StatelessWidget {
  const _DropDownWidget();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MobilityCubit, MobilityState, String?>(
      selector: (state) => state.selectedItem,
      builder: (context, selectedValue) {
        return DropdownButton<String>(
            hint: const Center(child: Text('select')),
            dropdownColor: Colors.deepPurpleAccent,
            isExpanded: true,
            value: selectedValue,
            style: context.textTheme.titleSmall,
            underline: Container(height: 2.h, color: Colors.deepPurpleAccent),
            onChanged: (String? value) => context.read<MobilityCubit>().setSelectedItem(value!),
            items: GlobalService.items.map((e) {
              return _dropdownMenuItem(e);
            }).toList());
      },
    );
  }

  DropdownMenuItem<String> _dropdownMenuItem(String item) =>
      DropdownMenuItem(value: item, child: Center(child: Text(item.toString())));
}

class _NextButton extends StatelessWidget {
  const _NextButton({required this.params});

  final MobilityParams params;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MobilityCubit, MobilityState, String?>(
      selector: (state) => state.selectedItem,
      builder: (context, mobility) {
        return CommonButton(
            text: LocaleKeys.nextText,
            onPressed: () {
              if (mobility == null) {
                warningToast(LocaleKeys.Auth_selectMobility.tr());
                return;
              }
              RouteManager.instance.push(HeightRoute(
                params: HeightParams(
                  username: params.username,
                  mail: params.mail,
                  password: params.password,
                  name: params.name,
                  gender: params.gender,
                  birthYear: params.birthYear,
                  mobility: mobility,
                ),
              ));
            });
      },
    );
  }
}
