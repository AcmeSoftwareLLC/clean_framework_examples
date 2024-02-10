import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/widgets/misc/firebase_loading_widget.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_entity.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/features/home/presentation/home_presenter.dart';
import 'package:clean_framework_firebase_example/core/widgets/post/image_post_card.dart';
import 'package:clean_framework_firebase_example/features/home/presentation/home_view_model.dart';

class HomeUI extends UI<HomeViewModel> {
  HomeUI({
    super.key,
  });

  @override
  HomePresenter create(WidgetBuilder builder) {
    return HomePresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return GestureDetector(
      child: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ...viewModel.userPosts.map(
                (post) => Column(
                  children: [
                    if (viewModel.loadingState != PostsLoadState.finished)
                      const FirebaseLoadingWidget(),
                    ImagePostCard(
                      post: post,
                      showComments: false,
                      onPostClicked: () => viewModel.onPostClicked(
                        post.postId,
                      ),
                      onDeleteClicked: () => viewModel.onDeletePost(
                        post.postId,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
