part of '../view/initial_view.dart';

class _GridBodyWidget extends StatelessWidget {
  const _GridBodyWidget();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        InkWell(
          onTap: () => RouteManager.instance.pushNamed(path: RouteConstants.exercise),
          child: _OptionWidgets(text: "Exercises", child: ImagePath.main_exercises.toPng()),
        ),
        InkWell(
          onTap: () => RouteManager.instance.pushNamed(path: RouteConstants.home),
          child: _OptionWidgets(text: "Diet List", child: ImagePath.diet_list.toPng()),
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
            Text(text, style: context.textTheme.titleLarge),
          ]),
        ));
  }
}
