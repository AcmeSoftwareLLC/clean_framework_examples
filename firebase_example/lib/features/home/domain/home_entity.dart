import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_model.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

enum PostsLoadState {
  loading,
  finished,
  error,
}

class HomeEntity extends Entity {
  const HomeEntity({
    this.user = const UserModel(
      userName: '',
      profileImageLink: '',
      verified: false,
    ),
    this.loadingState = PostsLoadState.loading,
    this.userPosts = const <UserPostModel>[],
    this.clickedPostId = '',
  });

  final UserModel user;

  final PostsLoadState loadingState;

  final List<UserPostModel> userPosts;
  final String clickedPostId;

  @override
  HomeEntity copyWith({
    UserModel? user,
    PostsLoadState? loadingState,
    List<UserPostModel>? userPosts,
    String? clickedPostId,
  }) {
    return HomeEntity(
      user: user ?? this.user,
      loadingState: loadingState ?? this.loadingState,
      userPosts: userPosts ?? this.userPosts,
      clickedPostId: clickedPostId ?? this.clickedPostId,
    );
  }

  @override
  List<Object?> get props => [
        user,
        loadingState,
        userPosts,
        clickedPostId,
      ];
}
