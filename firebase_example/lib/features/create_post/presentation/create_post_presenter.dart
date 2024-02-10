import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/widgets/misc/firebase_toast.dart';
import 'package:clean_framework_firebase_example/features/create_post/domain/create_post_domain_models.dart';
import 'package:clean_framework_firebase_example/features/create_post/domain/create_post_use_case.dart';
import 'package:clean_framework_firebase_example/features/create_post/presentation/create_post_view_model.dart';
import 'package:clean_framework_firebase_example/providers.dart';
import 'package:flutter/widgets.dart';

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
      onUsernameChanged: useCase.updateUsername,
      onProfileImageChanged: useCase.updateProfileImage,
      onVerifiedChanged: useCase.updateVerified,
      onPostImageChanged: useCase.updatePostImage,
      onPostDescriptionChanged: useCase.updatePostDescription,
      onPostLikesChanged: useCase.updatePostLikes,
      onPostDateChanged: useCase.updatePostDate,
      onAddPost: useCase.createPost,
    );
  }

  @override
  void onDomainModelUpdate(
      BuildContext context, CreatePostDomainToUIModel domainModel) {
    if (domainModel.createMessage.isNotEmpty) {
      FirebaseToast(
        title: domainModel.createMessage,
      ).show(context);
    }
  }
}
