import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/create_post/domain/create_post_domain_inputs.dart';
import 'package:clean_framework_firebase_example/features/create_post/domain/create_post_domain_models.dart';
import 'package:clean_framework_firebase_example/features/create_post/domain/create_post_entity.dart';
import 'package:clean_framework_firebase_example/core/models/user_model.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

class CreatePostUseCase extends UseCase<CreatePostEntity> {
  CreatePostUseCase()
      : super(
          entity: const CreatePostEntity(),
          transformers: [
            CreatePostDomainToUIModelTransformer(),
          ],
        );

  void updateUsername(String username) {
    clearCreateMessage();

    entity = entity.copyWith(posterUsername: username);
  }

  void updateProfileImage(String profileImage) {
    clearCreateMessage();

    entity = entity.copyWith(posterProfileImage: profileImage);
  }

  void updateVerified(bool verified) {
    clearCreateMessage();
    entity = entity.copyWith(posterVerified: verified);
  }

  void updatePostImage(String postImage) {
    clearCreateMessage();
    entity = entity.copyWith(postImage: postImage);
  }

  void updatePostDescription(String postDescription) {
    clearCreateMessage();
    entity = entity.copyWith(postDescription: postDescription);
  }

  void updatePostLikes(int postLikes) {
    clearCreateMessage();
    entity = entity.copyWith(postLikes: postLikes);
  }

  void updatePostDate(String postDate) {
    clearCreateMessage();
    entity = entity.copyWith(postDate: postDate);
  }

  void clearCreateMessage() => entity = entity.copyWith(createMessage: '');

  Future<void> createPost() async {
    await request<CreatePostSuccessDomainInput>(
      CreatePostDomainToGatewayModel(
        post: UserPostModel(
          postingUser: UserModel(
              profileImageLink: entity.posterProfileImage,
              userName: entity.posterUsername,
              verified: entity.posterVerified),
          postImageLink: entity.postImage,
          postLikes: entity.postLikes,
          postComment: entity.postDescription,
          postDate: entity.postDate,
        ),
      ),
      onSuccess: (success) =>
          entity = entity.copyWith(createMessage: 'Post created successfully.'),
      onFailure: (failure) =>
          entity.copyWith(createMessage: 'Could not create post.'),
    );
  }
}

class CreatePostDomainToUIModelTransformer extends DomainModelTransformer<
    CreatePostEntity, CreatePostDomainToUIModel> {
  @override
  CreatePostDomainToUIModel transform(CreatePostEntity entity) {
    return CreatePostDomainToUIModel(
      posterUsername: entity.posterUsername,
      posterProfileImage: entity.posterProfileImage,
      posterVerified: entity.posterVerified,
      postImage: entity.postImage,
      postDescription: entity.postDescription,
      postLikes: entity.postLikes,
      postDate: entity.postDate,
      createMessage: entity.createMessage,
    );
  }
}
