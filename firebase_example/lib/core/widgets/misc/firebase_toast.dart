import 'package:flutter/material.dart';

class FirebaseToast extends StatelessWidget {
  const FirebaseToast({
    required this.title,
    this.subtitle,
    super.key,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    if (subtitle == null) return Text(title);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title),
        Text(
          subtitle!,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  ScaffoldMessengerState show(
    BuildContext context,
  ) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: this, behavior: SnackBarBehavior.floating),
      );
  }
}
