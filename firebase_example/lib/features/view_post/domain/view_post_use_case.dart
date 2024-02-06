import 'package:clean_framework/clean_framework.dart';
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
}

class ViewPostDomainToUIModelTransformer
    extends DomainModelTransformer<ViewPostEntity, ViewPostDomainToUIModel> {
  @override
  ViewPostDomainToUIModel transform(ViewPostEntity entity) {
    return ViewPostDomainToUIModel(
      posterUsername: entity.posterUsername,
      posterProfileImage: entity.posterProfileImage,
      posterVerified: entity.posterVerified,
      postImage: entity.postImage,
      postDescription: entity.postDescription,
      postLikes: entity.postLikes,
      postDate: entity.postDate,
    );
  }
}
