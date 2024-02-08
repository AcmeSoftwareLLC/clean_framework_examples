import 'package:clean_framework/clean_framework.dart';
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

  Future<void> getPost(String postId) async {
    await request<ViewPostSuccessDomainInput>(
      ViewPostDomainToGatewayModel(postId: postId),
      onSuccess: (success) => entity = entity.copyWith(
        post: success.post,
      ),
      onFailure: (failure) => entity,
    );
  }
}

class ViewPostDomainToUIModelTransformer
    extends DomainModelTransformer<ViewPostEntity, ViewPostDomainToUIModel> {
  @override
  ViewPostDomainToUIModel transform(ViewPostEntity entity) {
    return ViewPostDomainToUIModel(
      post: entity.post,
    );
  }
}
