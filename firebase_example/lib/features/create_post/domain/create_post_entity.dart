import 'package:clean_framework/clean_framework.dart';

class CreatePostEntity extends Entity {
  const CreatePostEntity({
    this.posterUsername = '',
    this.posterProfileImage = '',
    this.posterVerified = false,
    this.postImage = '',
    this.postDescription = '',
    this.postLikes = 0,
    this.createMessage = '',
  });

  final String posterUsername;
  final String posterProfileImage;
  final bool posterVerified;

  final String postImage;
  final String postDescription;
  final int postLikes;

  final String createMessage;

  @override
  CreatePostEntity copyWith({
    String? posterUsername,
    String? posterProfileImage,
    bool? posterVerified,
    String? postImage,
    String? postDescription,
    int? postLikes,
    String? postDate,
    String? createMessage,
  }) {
    return CreatePostEntity(
      posterUsername: posterUsername ?? this.posterUsername,
      posterProfileImage: posterProfileImage ?? this.posterProfileImage,
      posterVerified: posterVerified ?? this.posterVerified,
      postImage: postImage ?? this.postImage,
      postDescription: postDescription ?? this.postDescription,
      postLikes: postLikes ?? this.postLikes,
      createMessage: createMessage ?? this.createMessage,
    );
  }

  @override
  List<Object?> get props => [
        posterUsername,
        posterProfileImage,
        posterVerified,
        postImage,
        postDescription,
        postLikes,
        createMessage,
      ];
}
