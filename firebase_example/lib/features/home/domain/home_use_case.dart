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
    entity = entity.copyWith(
      loadingState: LoadPostsState.loading,
      deletePostState: DeletePostState.none,
    );

    await request<HomeGetPostsSuccessDomainInput>(
      const HomeGetPostsDomainToGatewayModel(),
      onSuccess: (success) {
        return entity = entity.copyWith(
          userPosts: success.posts,
          loadingState: LoadPostsState.finished,
        );
      },
      onFailure: (failure) {
        return entity.copyWith(
          loadingState: LoadPostsState.error,
        );
      },
    );
  }

  void navigateToPost(String postId) {
    entity = entity.copyWith(
      clickedPostId: postId,
    );
  }

  Future<void> deletePost(String postId) async {
    await request<HomeDeletePostSuccessDomainInput>(
      HomeDeletePostDomainToGatewayModel(
        id: postId,
      ),
      onSuccess: (success) => entity.copyWith(
        deletePostState: DeletePostState.success,
      ),
      onFailure: (failure) => entity.copyWith(
        deletePostState: DeletePostState.failure,
      ),
    );
    await getPosts();
  }
}

class HomeDomainToUIModelTransformer
    extends DomainModelTransformer<HomeEntity, HomeDomainToUIModel> {
  @override
  HomeDomainToUIModel transform(HomeEntity entity) {
    return HomeDomainToUIModel(
      user: entity.user,
      loadingState: entity.loadingState,
      deletePostState: entity.deletePostState,
      userPosts: entity.userPosts,
    );
  }
}
