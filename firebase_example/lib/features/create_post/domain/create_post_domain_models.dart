import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

class CreatePostDomainToUIModel extends DomainModel {
  const CreatePostDomainToUIModel({
    required this.posterUsername,
    required this.posterProfileImage,
    required this.posterVerified,
    required this.postImage,
    required this.postDescription,
    required this.postLikes,
    required this.postDate,
  });

  final String posterUsername;
  final String posterProfileImage;
  final bool posterVerified;

  final String postImage;
  final String postDescription;
  final int postLikes;
  final String postDate;

  @override
  List<Object?> get props => [
        posterUsername,
        posterProfileImage,
        posterVerified,
        postImage,
        postDescription,
        postLikes,
        postDate,
      ];
}

class CreatePostDomainToGatewayModel extends DomainModel {
  const CreatePostDomainToGatewayModel({
    required this.post,
    // required this.posterUsername,
    // required this.posterProfileImage,
    // required this.posterVerified,
    // required this.postImage,
    // required this.postDescription,
    // required this.postLikes,
    // required this.postDate,
  });

  final UserPostModel post;

  // final String posterUsername;
  // final String posterProfileImage;
  // final bool posterVerified;

  // final String postImage;
  // final String postDescription;
  // final int postLikes;
  // final String postDate;

  @override
  List<Object?> get props => [
        post,
        // posterUsername,
        // posterProfileImage,
        // posterVerified,
        // postImage,
        // postDescription,
        // postLikes,
        // postDate,
      ];
}
