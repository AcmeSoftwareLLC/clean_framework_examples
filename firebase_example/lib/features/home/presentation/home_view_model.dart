import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_entity.dart';

class HomeViewModel extends ViewModel {
  const HomeViewModel({
    required this.loadingState,
    required this.userProfileImage,
    required this.userPosts,
    required this.onPostClicked,
    required this.onDeletePost,
  });

  final PostsLoadState loadingState;

  final String userProfileImage;
  final List<UserPostModel> userPosts;

  final void Function(String) onPostClicked;
  final void Function(String) onDeletePost;

  @override
  List<Object> get props => [
        userProfileImage,
        userPosts,
      ];
}
