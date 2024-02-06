import 'package:clean_framework_firebase_example/core/theme/firebase_example_theme.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/core/widgets/user/profile_icon_widget.dart';
import 'package:clean_framework_firebase_example/providers/dependency_providers.dart';

class ExampleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ExampleAppBar({
    super.key,
    required this.pageName,
    this.displayProfileButton = true,
    this.onButtonPress,
  });

  final String pageName;
  final bool displayProfileButton;
  final void Function()? onButtonPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: FirebaseExampleTheme.of(context).primaryBackground,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: onButtonPress,
        icon: const Icon(
          Icons.menu,
        ),
      ),
      title: Text(
        pageName,
        style: FirebaseExampleTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: FirebaseExampleTheme.of(context).primaryText,
              fontSize: 22.0,
            ),
      ),
      centerTitle: false,
      elevation: 0.0,
      actions: [
        if (displayProfileButton) ProfileIconWidget(user: thisUser),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
