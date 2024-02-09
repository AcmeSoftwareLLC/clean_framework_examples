import 'package:clean_framework_firebase_example/core/widgets/post/image_post_icon_button.dart';
import 'package:clean_framework_firebase_example/core/theme/firebase_example_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:clean_framework_firebase_example/core/widgets/post/image_post_comment_widget.dart';
import 'package:clean_framework_firebase_example/core/widgets/user/profile_icon_widget.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

class ImagePostCard extends StatelessWidget {
  const ImagePostCard({
    super.key,
    required this.post,
    required this.showComments,
    required this.onPostClicked,
  });

  final UserPostModel post;
  final bool showComments;

  final void Function() onPostClicked;

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ProfileIconWidget(
                    user: post.postingUser,
                    width: 35.0,
                    height: 35.0,
                  ),
                  Text(
                    post.postingUser.userName,
                    style: FirebaseExampleTheme.of(context).bodyMedium,
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
              Row(
                children: [
                  ImagePostIconButton(
                    borderRadius: 20.0,
                    buttonSize: 40.0,
                    fillColor:
                        FirebaseExampleTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.more_horiz,
                      color: FirebaseExampleTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                    onPressed: () {},
                  ),
                ],
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
                      ImagePostIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor:
                            FirebaseExampleTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          color: FirebaseExampleTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () {
                          print('Like button pressed ...');
                        },
                      ),
                      ImagePostIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor:
                            FirebaseExampleTheme.of(context).primaryBackground,
                        icon: Icon(
                          showComments
                              ? Icons.chat_bubble
                              : Icons.chat_bubble_outline_rounded,
                          color: FirebaseExampleTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: onPostClicked,
                      ),
                      ImagePostIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor:
                            FirebaseExampleTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.share_rounded,
                          color: FirebaseExampleTheme.of(context).primaryText,
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
                      ImagePostIconButton(
                        borderRadius: 20.0,
                        buttonSize: 40.0,
                        fillColor:
                            FirebaseExampleTheme.of(context).primaryBackground,
                        icon: Icon(
                          Icons.bookmark_border_rounded,
                          color: FirebaseExampleTheme.of(context).primaryText,
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
                          style: FirebaseExampleTheme.of(context).bodyMedium,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: ImagePostCommentWidget(
                            userName: post.postingUser.userName,
                            comment: post.postComment,
                          ),
                        ),
                      ],
                    ),
                    if (!showComments)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (post.comments.isNotEmpty)
                            InkWell(
                              onTap: onPostClicked,
                              child: RichText(
                                text: TextSpan(
                                  text:
                                      'View all ${post.comments.length} comments',
                                  style: FirebaseExampleTheme.of(context)
                                      .bodyMedium,
                                ),
                              ),
                            ),
                          if (post.comments.isNotEmpty)
                            ImagePostCommentWidget(
                              userName: post
                                  .comments[post.comments.length - 1].userName,
                              comment: post
                                  .comments[post.comments.length - 1].message,
                            ),
                        ],
                      )
                    else
                      ...post.comments.map(
                        (e) {
                          return ImagePostCommentWidget(
                            userName: e.userName,
                            comment: e.message,
                          );
                        },
                      ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      post.postDate,
                      style: FirebaseExampleTheme.of(context).labelSmall,
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
