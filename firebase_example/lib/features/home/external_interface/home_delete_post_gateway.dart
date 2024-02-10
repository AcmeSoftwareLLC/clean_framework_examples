import 'package:clean_framework_firestore/clean_framework_firestore.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_domain_inputs.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_domain_models.dart';

class HomeDeletePostGateway extends FirebaseGateway<
    HomeDeletePostDomainToGatewayModel,
    HomeDeletePostRequest,
    HomeDeletePostSuccessDomainInput> {
  @override
  HomeDeletePostRequest buildRequest(
      HomeDeletePostDomainToGatewayModel domainModel) {
    return HomeDeletePostRequest(
      path: '/posts',
      id: domainModel.id,
    );
  }

  @override
  HomeDeletePostSuccessDomainInput onSuccess(
      covariant FirebaseSuccessResponse response) {
    return HomeDeletePostSuccessDomainInput();
  }
}

class HomeDeletePostRequest extends FirebaseDeleteRequest {
  const HomeDeletePostRequest({
    required super.path,
    required super.id,
  });
}
