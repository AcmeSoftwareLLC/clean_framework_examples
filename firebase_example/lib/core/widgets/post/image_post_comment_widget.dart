import 'package:clean_framework_firebase_example/core/theme/firebase_example_theme.dart';
import 'package:flutter/material.dart';

class ImagePostCommentWidget extends StatelessWidget {
  const ImagePostCommentWidget({
    super.key,
    required this.userName,
    required this.comment,
  });

  final String userName;
  final String comment;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: userName,
        style: FirebaseExampleTheme.of(context).bodyMedium,
        children: [
          TextSpan(
            style: FirebaseExampleTheme.of(context).labelMedium,
            text: ' $comment',
          )
        ],
      ),
    );
  }
}
