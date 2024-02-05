import 'package:clean_framework_firestore/clean_framework_firestore.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_domain_inputs.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_domain_models.dart';
import 'package:clean_framework_firebase_example/features/home/models/user_post_model.dart';

class HomeGetPostsGateway extends FirebaseGateway<
    HomeGetPostsDomainToGatewayModel,
    HomeGetPostsRequest,
    HomeGetPostsSuccessDomainInput> {
  @override
  HomeGetPostsRequest buildRequest(
      HomeGetPostsDomainToGatewayModel domainModel) {
    return const HomeGetPostsRequest(path: '/posts');
  }

  @override
  HomeGetPostsSuccessDomainInput onSuccess(
      covariant FirebaseSuccessResponse response) {
    return HomeGetPostsSuccessDomainInput(
      posts: [
        UserPostModel.fromJson(
          response.json,
        )
      ],
    );
  }
}

class HomeGetPostsRequest extends FirebaseReadAllRequest {
  const HomeGetPostsRequest({required super.path});
}
