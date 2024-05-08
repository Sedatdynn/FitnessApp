part of '../view/profile_view.dart';

class _CustomProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomProfileAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => RouteManager.instance.pushNamed(path: RouteConstants.main),
      ),
      actions: const [
        Padding(
          padding: AppPadding.normalHorizontal(),
          child: Icon(Icons.person),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ProfileSectionListTile extends StatelessWidget {
  const _ProfileSectionListTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(title, style: context.textTheme.titleSmall),
      subtitle: Text(subtitle, style: context.textTheme.bodyLarge),
    );
  }
}
