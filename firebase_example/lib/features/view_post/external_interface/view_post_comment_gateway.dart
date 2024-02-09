import 'package:clean_framework_firebase_example/core/models/user_comment_model.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_domain_inputs.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_domain_models.dart';
import 'package:clean_framework_firestore/clean_framework_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewPostCommentGateway extends FirebaseGateway<
    ViewPostCommentDomainToGatewayModel,
    PostCommentUpdateRequest,
    PostCommentSuccessDomainInput> {
  @override
  PostCommentUpdateRequest buildRequest(
      ViewPostCommentDomainToGatewayModel domainModel) {
    return PostCommentUpdateRequest(
      path: '/posts',
      id: domainModel.postId,
      comment: domainModel.comment,
    );
  }

  @override
  PostCommentSuccessDomainInput onSuccess(
      covariant FirebaseSuccessResponse response) {
    return PostCommentSuccessDomainInput();
  }
}

class PostCommentUpdateRequest extends FirebaseUpdateRequest {
  const PostCommentUpdateRequest({
    required super.path,
    required super.id,
    required this.comment,
  });

  final UserCommentModel comment;

  @override
  Map<String, dynamic> toJson() => {
        'comments': FieldValue.arrayUnion(
          [
            comment.toJson(),
          ],
        ),
      };
}
