import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/widgets/misc/firebase_toast.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_domain_models.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_entity.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_use_case.dart';
import 'package:clean_framework_firebase_example/features/view_post/presentation/view_post_view_model.dart';
import 'package:clean_framework_firebase_example/providers.dart';
import 'package:flutter/widgets.dart';

class ViewPostPresenter extends Presenter<ViewPostViewModel,
    ViewPostDomainToUIModel, ViewPostUseCase> {
  ViewPostPresenter({
    required super.builder,
    super.key,
    this.postId = '',
  }) : super(provider: viewPostUseCaseProvider);

  final String postId;

  @override
  void onLayoutReady(BuildContext context, ViewPostUseCase useCase) {
    useCase.getPost(postId);
  }

  @override
  ViewPostViewModel createViewModel(
      ViewPostUseCase useCase, ViewPostDomainToUIModel domainModel) {
    return ViewPostViewModel(
      post: domainModel.post,
      loadState: domainModel.loadState,
      userComment: domainModel.userComment,
      onCommentChanged: useCase.onCommentChanged,
      onSendComment: useCase.postComment,
    );
  }

  @override
  void onDomainModelUpdate(
      BuildContext context, ViewPostDomainToUIModel domainModel) {
    if (domainModel.commentState == PostCommentState.successful) {
      const FirebaseToast(
        title: 'Comment posted successfully',
      ).show(context);
    } else if (domainModel.commentState == PostCommentState.failed) {
      const FirebaseToast(
        title: 'Something went wrong',
      ).show(context);
    }
  }
}
