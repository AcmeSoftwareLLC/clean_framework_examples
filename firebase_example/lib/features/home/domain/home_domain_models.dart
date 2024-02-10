import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_model.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_entity.dart';

class HomeDomainToUIModel extends DomainModel {
  const HomeDomainToUIModel({
    required this.user,
    required this.loadingState,
    required this.userPosts,
  });

  final UserModel user;
  final PostsLoadState loadingState;
  final List<UserPostModel> userPosts;

  @override
  List<Object?> get props => [
        user,
        loadingState,
        userPosts,
      ];
}

class HomeGetPostsDomainToGatewayModel extends DomainModel {
  const HomeGetPostsDomainToGatewayModel();

  @override
  List<Object?> get props => [];
}

class HomeDeletePostDomainToGatewayModel extends DomainModel {
  const HomeDeletePostDomainToGatewayModel({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [
        id,
      ];
}
