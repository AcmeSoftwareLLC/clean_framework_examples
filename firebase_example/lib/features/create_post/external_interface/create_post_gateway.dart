import 'package:clean_framework_firebase_example/features/create_post/domain/create_post_domain_inputs.dart';
import 'package:clean_framework_firebase_example/features/create_post/domain/create_post_domain_models.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';
import 'package:clean_framework_firestore/clean_framework_firestore.dart';

class CreatePostGateway extends FirebaseGateway<CreatePostDomainToGatewayModel,
    CreatePostWriteRequest, CreatePostSuccessDomainInput> {
  @override
  CreatePostWriteRequest buildRequest(
      CreatePostDomainToGatewayModel domainModel) {
    return CreatePostWriteRequest(
      path: '/posts',
      post: domainModel.post,
    );
  }

  @override
  CreatePostSuccessDomainInput onSuccess(
      covariant FirebaseSuccessResponse response) {
    return CreatePostSuccessDomainInput();
  }
}

class CreatePostWriteRequest extends FirebaseWriteRequest {
  const CreatePostWriteRequest({
    required super.path,
    required this.post,
  });

  final UserPostModel post;

  @override
  Map<String, dynamic> toJson() => post.toJson();
}
