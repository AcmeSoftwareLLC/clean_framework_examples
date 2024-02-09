import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_comment_model.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_domain_inputs.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_domain_models.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_entity.dart';

class ViewPostUseCase extends UseCase<ViewPostEntity> {
  ViewPostUseCase()
      : super(
          entity: const ViewPostEntity(),
          transformers: [
            ViewPostDomainToUIModelTransformer(),
          ],
        );

  Future<void> getPost(String postId, {bool resetLoadState = true}) async {
    entity = entity.copyWith(
      postId: postId,
      commentState: PostCommentState.none,
    );

    if (resetLoadState) {
      entity = entity.copyWith(
        loadState: PostLoadState.loading,
      );
    }

    await request<ViewPostSuccessDomainInput>(
      ViewPostDomainToGatewayModel(postId: postId),
      onSuccess: (success) {
        entity = entity.copyWith(
          loadState: PostLoadState.successful,
        );

        return entity = entity.copyWith(
          post: success.post,
        );
      },
      onFailure: (failure) => entity.copyWith(
        loadState: PostLoadState.failed,
      ),
    );
  }

  void onCommentChanged(String comment) {
    entity = entity.copyWith(
      userComment: comment,
    );
  }

  Future<void> postComment() async {
    await request<PostCommentSuccessDomainInput>(
      ViewPostCommentDomainToGatewayModel(
        postId: entity.postId,
        comment: UserCommentModel(
          userName: 'firebase_example',
          message: entity.userComment,
        ),
      ),
      onSuccess: (success) {
        return entity = entity.copyWith(
          commentState: PostCommentState.successful,
        );
      },
      onFailure: (failure) => entity.copyWith(
        commentState: PostCommentState.failed,
      ),
    );

    getPost(
      entity.postId,
      resetLoadState: false,
    );
  }
}

class ViewPostDomainToUIModelTransformer
    extends DomainModelTransformer<ViewPostEntity, ViewPostDomainToUIModel> {
  @override
  ViewPostDomainToUIModel transform(ViewPostEntity entity) {
    return ViewPostDomainToUIModel(
      post: entity.post,
      loadState: entity.loadState,
      commentState: entity.commentState,
      userComment: entity.userComment,
    );
  }
}
