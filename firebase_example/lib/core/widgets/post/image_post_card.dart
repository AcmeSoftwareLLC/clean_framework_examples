import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clean_framework_firebase_example/core/widgets/post/post_comment_widget.dart';
import 'package:clean_framework_firebase_example/core/widgets/user/profile_icon_widget.dart';
import 'package:clean_framework_firebase_example/dependency/flutter_flow/flutter_flow_icon_button.dart';
import 'package:clean_framework_firebase_example/dependency/flutter_flow/flutter_flow_theme.dart';
import 'package:clean_framework_firebase_example/features/home/models/user_post_model.dart';

class ImagePostCard extends StatelessWidget {
  const ImagePostCard({
    super.key,
    required this.post,
  });

  final UserPostModel post;

  @override
  Widget build(BuildContext context) {
    final numFormatter = NumberFormat('#,###,###');

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileIconWidget(
                user: post.postingUser,
                width: 35.0,
                height: 35.0,
              ),
              Text(
                post.postingUser.userName,
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              if (post.postingUser.verified)
                const SizedBox(
                  width: 6.0,
                ),
              if (post.postingUser.verified)
                const Icon(
                  Icons.verified,
                  color: Colors.blue,
                  size: 16.0,
                ),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(0.0),
            child: Image.network(
              post.postImageLink,
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 1.33,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                // Icon row
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('Like button pressed ...');
                        },
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.chat_bubble_outline_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('Comment button pressed ...');
                        },
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.share_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('Share button pressed ...');
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlutterFlowIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.bookmark_border_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('Save button pressed ...');
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  8.0,
                  0.0,
                  8.0,
                  0.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${numFormatter.format(post.postLikes)} likes',
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: PostCommentWidget(
                            userName: post.postingUser.userName,
                            comment: post.postComment,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'View 16 comments',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                    const PostCommentWidget(
                        userName: 'test_user', comment: 'test comment'),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      post.postDate,
                      style: FlutterFlowTheme.of(context).labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
