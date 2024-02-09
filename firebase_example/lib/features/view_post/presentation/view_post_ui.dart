import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/widgets/misc/firebase_loading_widget.dart';
import 'package:clean_framework_firebase_example/core/widgets/post/image_post_card.dart';
import 'package:clean_framework_firebase_example/core/widgets/user/comment_field_widget.dart';
import 'package:clean_framework_firebase_example/core/widgets/user/profile_icon_widget.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_entity.dart';
import 'package:clean_framework_firebase_example/features/view_post/presentation/view_post_presenter.dart';
import 'package:clean_framework_firebase_example/features/view_post/presentation/view_post_view_model.dart';
import 'package:flutter/material.dart';

class ViewPostUI extends UI<ViewPostViewModel> {
  ViewPostUI({
    super.key,
    this.postId = '',
  });

  final String postId;

  @override
  ViewPostPresenter create(WidgetBuilder builder) {
    return ViewPostPresenter(
      builder: builder,
      postId: postId,
    );
  }

  @override
  Widget build(BuildContext context, ViewPostViewModel viewModel) {
    return viewModel.loadState == PostLoadState.successful
        ? GestureDetector(
            child: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      children: [
                        ImagePostCard(
                          post: viewModel.post,
                          showComments: true,
                          onPostClicked: () {},
                        ),
                        CommentFieldWidget(
                          iconWidget: ProfileIconWidget(
                            user: viewModel.post.postingUser,
                            width: 40.0,
                            height: 40.0,
                          ),
                          onChanged: viewModel.onCommentChanged,
                          onSend: viewModel.onSendComment,
                          value: viewModel.userComment,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : const FirebaseLoadingWidget();
  }
}
