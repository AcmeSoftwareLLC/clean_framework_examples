import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/widgets/post/image_post_card.dart';
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
    return viewModel.post.postId != ''
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
                          onPostClicked: () {},
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        : Container();
  }
}
