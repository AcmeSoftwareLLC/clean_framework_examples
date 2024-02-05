import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/dependency/flutter_flow/flutter_flow_theme.dart';

class PostCommentWidget extends StatelessWidget {
  const PostCommentWidget({
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
        style: FlutterFlowTheme.of(context).bodyMedium,
        children: [
          TextSpan(
            style: FlutterFlowTheme.of(context).labelMedium,
            text: ' $comment',
          )
        ],
      ),
    );
  }
}
