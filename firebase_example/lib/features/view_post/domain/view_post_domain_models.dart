import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

class ViewPostDomainToUIModel extends DomainModel {
  const ViewPostDomainToUIModel({
    required this.post,
  });

  final UserPostModel post;

  @override
  List<Object?> get props => [
        post,
      ];
}

class ViewPostDomainToGatewayModel extends DomainModel {
  const ViewPostDomainToGatewayModel({
    required this.postId,
  });

  final String postId;

  @override
  List<Object?> get props => [
        postId,
      ];
}
