import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_model.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

enum LoadPostsState {
  loading,
  finished,
  error,
}

enum DeletePostState {
  none,
  success,
  failure,
}

class HomeEntity extends Entity {
  const HomeEntity({
    this.user = const UserModel(
      userName: '',
      profileImageLink: '',
      verified: false,
    ),
    this.loadingState = LoadPostsState.loading,
    this.deletePostState = DeletePostState.none,
    this.userPosts = const <UserPostModel>[],
    this.clickedPostId = '',
  });

  final UserModel user;

  final LoadPostsState loadingState;
  final DeletePostState deletePostState;

  final List<UserPostModel> userPosts;
  final String clickedPostId;

  @override
  HomeEntity copyWith({
    UserModel? user,
    LoadPostsState? loadingState,
    DeletePostState? deletePostState,
    List<UserPostModel>? userPosts,
    String? clickedPostId,
  }) {
    return HomeEntity(
      user: user ?? this.user,
      loadingState: loadingState ?? this.loadingState,
      deletePostState: deletePostState ?? this.deletePostState,
      userPosts: userPosts ?? this.userPosts,
      clickedPostId: clickedPostId ?? this.clickedPostId,
    );
  }

  @override
  List<Object?> get props => [
        user,
        loadingState,
        deletePostState,
        userPosts,
        clickedPostId,
      ];
}
