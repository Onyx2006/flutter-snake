import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'switch_theme_button.dart';
import 'home_button.dart';
import '../routing/routes.dart';

class Bar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const Bar({
    super.key, 
    required this.title
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 600;
    final iconSize = isDesktop ? 30.0 : 24.0;
    final fontSize = isDesktop ? 24.0 : 18.0;

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeButton(
            onPressed: () {
              GoRouter.of(context).go(Routes.home);
            },
            iconSize: iconSize,
          ),
          Text(title, style: TextStyle(fontSize: fontSize)),
          SwitchThemeButton(iconSize: iconSize),
        ],
      ),
    );
  }
}
