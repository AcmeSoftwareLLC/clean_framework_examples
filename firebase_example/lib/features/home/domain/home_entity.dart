import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_model.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

class HomeEntity extends Entity {
  const HomeEntity({
    this.user = const UserModel(
      userName: '',
      profileImageLink: '',
      verified: false,
    ),
    this.userPosts = const <UserPostModel>[],
    this.clickedPostId = '',
  });

  final UserModel user;
  final List<UserPostModel> userPosts;
  final String clickedPostId;

  @override
  HomeEntity copyWith({
    UserModel? user,
    List<UserPostModel>? userPosts,
    String? clickedPostId,
  }) {
    return HomeEntity(
      user: user ?? this.user,
      userPosts: userPosts ?? this.userPosts,
      clickedPostId: clickedPostId ?? this.clickedPostId,
    );
  }

  @override
  List<Object?> get props => [
        user,
        userPosts,
        clickedPostId,
      ];
}
