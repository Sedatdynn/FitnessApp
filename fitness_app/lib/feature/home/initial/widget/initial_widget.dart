part of '../view/initial_view.dart';

class _GridBodyWidget extends StatefulWidget {
  const _GridBodyWidget();

  @override
  State<_GridBodyWidget> createState() => _GridBodyWidgetState();
}

class _GridBodyWidgetState extends State<_GridBodyWidget> {
  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() {
    final user = context.read<GlobalCubit>().user;
    user.email == null ? context.read<GlobalCubit>().getUser() : null;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        InkWell(
          onTap: () => RouteManager.instance.pushNamed(path: RouteConstants.exercise),
          child:
              _OptionWidgets(text: LocaleKeys.exercises, child: Assets.png.mainExercises.image()),
        ),
        InkWell(
          onTap: () => RouteManager.instance.pushNamed(path: RouteConstants.diet),
          child: _OptionWidgets(text: LocaleKeys.diet, child: Assets.png.dietList.image()),
        ),
      ],
    );
  }
}

class _OptionWidgets extends StatelessWidget {
  final String text;
  final Widget child;

  const _OptionWidgets({required this.text, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const AppPadding.minAll(),
        decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            Expanded(
              child: child,
            ),
            Text(text, style: context.textTheme.titleLarge).tr(),
          ]),
        ));
  }
}
