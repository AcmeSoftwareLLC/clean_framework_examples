import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/home/models/user_model.dart';
import 'package:clean_framework_firebase_example/features/home/models/user_post_model.dart';

class HomeDomainToUIModel extends DomainModel {
  const HomeDomainToUIModel({
    required this.user,
    required this.userPosts,
  });

  final UserModel user;
  final List<UserPostModel> userPosts;

  @override
  List<Object?> get props => [
        user,
        userPosts,
      ];
}

class HomeGetPostsDomainToGatewayModel extends DomainModel {
  const HomeGetPostsDomainToGatewayModel();

  @override
  List<Object?> get props => [];
}
