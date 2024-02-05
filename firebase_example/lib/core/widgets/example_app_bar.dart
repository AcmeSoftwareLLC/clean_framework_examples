import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/core/widgets/user/profile_icon_widget.dart';
import 'package:clean_framework_firebase_example/dependency/flutter_flow/flutter_flow_theme.dart';
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: onButtonPress,
        icon: const Icon(
          Icons.menu,
        ),
      ),
      title: Text(
        pageName,
        style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Outfit',
              color: FlutterFlowTheme.of(context).primaryText,
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
