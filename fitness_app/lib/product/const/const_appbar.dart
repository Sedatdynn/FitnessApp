import 'package:fistness_app_firebase/product/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget with PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.scfBackColor,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_outlined,
          color: context.mainColor,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
