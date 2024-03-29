import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_domain_inputs.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_domain_models.dart';
import 'package:clean_framework_firestore/clean_framework_firestore.dart';

class ViewPostGateway extends FirebaseGateway<ViewPostDomainToGatewayModel,
    ViewPostReadRequest, ViewPostSuccessDomainInput> {
  @override
  ViewPostReadRequest buildRequest(ViewPostDomainToGatewayModel domainModel) {
    return ViewPostReadRequest(
      path: '/posts',
      id: domainModel.postId,
    );
  }

  @override
  ViewPostSuccessDomainInput onSuccess(
      covariant FirebaseSuccessResponse response) {
    return ViewPostSuccessDomainInput(
      post: UserPostModel.fromJson(
        response.json,
      ),
    );
  }
}

class ViewPostReadRequest extends FirebaseReadIdRequest {
  const ViewPostReadRequest({
    required super.path,
    required super.id,
  });
}
