part of '../view/mobility_view.dart';

class _DropDownWidget extends StatelessWidget {
  const _DropDownWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MobilityCubit, MobilityState>(
      builder: (context, state) {
        return DropdownButton<String>(
            hint: const Center(child: Text('select')),
            dropdownColor: Colors.deepPurpleAccent,
            isExpanded: true,
            value: state.selectedItem,
            style: Theme.of(context).textTheme.titleMedium,
            underline: Container(height: 2.h, color: Colors.deepPurpleAccent),
            onChanged: (String? value) => context.read<MobilityCubit>().setSelectedItem(value!),
            items: context.read<MobilityCubit>().items.map((e) {
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
    return BlocBuilder<MobilityCubit, MobilityState>(
      builder: (context, state) {
        return CommonButton(
            text: MyText.nextText,
            onPressed: () {
              if (state.selectedItem == null) {
                warningToast(RegisterText.selectMobility);
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
                  mobility: state.selectedItem,
                ),
              ));
            });
      },
    );
  }
}
