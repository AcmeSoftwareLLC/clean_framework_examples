import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

class ViewPostDomainToUIModel extends DomainModel {
  const ViewPostDomainToUIModel({
    required this.posterUsername,
    required this.posterProfileImage,
    required this.posterVerified,
    required this.postImage,
    required this.postDescription,
    required this.postLikes,
    required this.postDate,
    this.createMessage = '',
  });

  final String posterUsername;
  final String posterProfileImage;
  final bool posterVerified;

  final String postImage;
  final String postDescription;
  final int postLikes;
  final String postDate;

  final String createMessage;

  @override
  List<Object?> get props => [
        posterUsername,
        posterProfileImage,
        posterVerified,
        postImage,
        postDescription,
        postLikes,
        postDate,
        createMessage,
      ];
}

class ViewPostDomainToGatewayModel extends DomainModel {
  const ViewPostDomainToGatewayModel({
    required this.post,
  });

  final UserPostModel post;

  @override
  List<Object?> get props => [
        post,
      ];
}
