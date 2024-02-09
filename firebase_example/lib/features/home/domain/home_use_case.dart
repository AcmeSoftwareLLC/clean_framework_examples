import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_domain_inputs.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_domain_models.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_entity.dart';

class HomeUseCase extends UseCase<HomeEntity> {
  HomeUseCase()
      : super(
          entity: const HomeEntity(),
          transformers: [
            HomeDomainToUIModelTransformer(),
          ],
        );

  Future<void> getPosts() async {
    entity = entity.copyWith(loadingState: PostsLoadState.loading);

    await request<HomeGetPostsSuccessDomainInput>(
      const HomeGetPostsDomainToGatewayModel(),
      onSuccess: (success) {
        return entity = entity.copyWith(
          userPosts: success.posts,
          loadingState: PostsLoadState.finished,
        );
      },
      onFailure: (failure) {
        return entity.copyWith(
          loadingState: PostsLoadState.error,
        );
      },
    );
  }

  void navigateToPost(String postId) {
    entity = entity.copyWith(
      clickedPostId: postId,
    );
  }

  void deletePost(String postId) {
    print('delete post $postId');
  }
}

class HomeDomainToUIModelTransformer
    extends DomainModelTransformer<HomeEntity, HomeDomainToUIModel> {
  @override
  HomeDomainToUIModel transform(HomeEntity entity) {
    return HomeDomainToUIModel(
      user: entity.user,
      loadingState: entity.loadingState,
      userPosts: entity.userPosts,
    );
  }
}
