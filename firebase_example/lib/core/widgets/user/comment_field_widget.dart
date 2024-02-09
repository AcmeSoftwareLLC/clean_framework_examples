import 'package:clean_framework_firebase_example/core/theme/firebase_example_theme.dart';
import 'package:clean_framework_firebase_example/core/widgets/post/image_post_icon_button.dart';
import 'package:flutter/material.dart';

class CommentFieldWidget extends StatelessWidget {
  const CommentFieldWidget({
    super.key,
    required this.iconWidget,
    required this.onChanged,
    required this.onSend,
    this.value = '',
  });

  final Widget iconWidget;
  final String value;

  final void Function(String) onChanged;
  final void Function() onSend;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(1.0, 1.0, 16.0, 0.0),
      child: TextField(
        style: FirebaseExampleTheme.of(context).labelSmall,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: iconWidget,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.0),
            ),
          ),
          suffixIcon: ImagePostIconButton(
            buttonSize: 45.0,
            borderRadius: 30.0,
            icon: const Icon(
              Icons.arrow_upward,
              size: 25.0,
              color: Colors.white,
            ),
            fillColor: Colors.blue,
            onPressed: onSend,
          ),
          labelText: 'Leave a comment as firebase_example...',
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    );
  }
}
