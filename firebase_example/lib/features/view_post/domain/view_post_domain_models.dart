import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_comment_model.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_entity.dart';

class ViewPostDomainToUIModel extends DomainModel {
  const ViewPostDomainToUIModel({
    required this.post,
    required this.loadState,
    required this.commentState,
    required this.userComment,
  });

  final UserPostModel post;
  final PostLoadState loadState;
  final PostCommentState commentState;

  final String userComment;

  @override
  List<Object?> get props => [
        post,
        loadState,
        commentState,
        userComment,
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

class ViewPostCommentDomainToGatewayModel extends DomainModel {
  const ViewPostCommentDomainToGatewayModel({
    required this.comment,
    required this.postId,
  });

  final UserCommentModel comment;
  final String postId;

  @override
  List<Object?> get props => [
        comment,
        postId,
      ];
}
