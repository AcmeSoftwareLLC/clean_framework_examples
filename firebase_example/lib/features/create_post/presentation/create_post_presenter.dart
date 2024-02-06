import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/create_post/domain/create_post_domain_models.dart';
import 'package:clean_framework_firebase_example/features/create_post/domain/create_post_use_case.dart';
import 'package:clean_framework_firebase_example/features/create_post/presentation/create_post_view_model.dart';
import 'package:clean_framework_firebase_example/providers.dart';

class CreatePostPresenter extends Presenter<CreatePostViewModel,
    CreatePostDomainToUIModel, CreatePostUseCase> {
  CreatePostPresenter({
    required super.builder,
    super.key,
  }) : super(provider: createPostUseCaseProvider);

  @override
  CreatePostViewModel createViewModel(
      CreatePostUseCase useCase, CreatePostDomainToUIModel domainModel) {
    return CreatePostViewModel(
      posterUsername: domainModel.posterUsername,
      posterProfileImage: domainModel.posterProfileImage,
      posterVerified: domainModel.posterVerified,
      postImage: domainModel.postImage,
      postDescription: domainModel.postDescription,
      postLikes: domainModel.postLikes,
      postDate: domainModel.postDate,
      onUsernameChanged: (value) => useCase.updateUsername(value),
      onProfileImageChanged: (value) => useCase.updateProfileImage(value),
      onVerifiedChanged: (value) => useCase.updateVerified(value),
      onPostImageChanged: (value) => useCase.updatePostImage(value),
      onPostDescriptionChanged: (value) => useCase.updatePostDescription(value),
      onPostLikesChanged: (value) => useCase.updatePostLikes(value),
      onPostDateChanged: (value) => useCase.updatePostDate(value),
      onAddPost: useCase.createPost,
    );
  }
}
