import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

class HomeViewModel extends ViewModel {
  const HomeViewModel({
    required this.userProfileImage,
    required this.userPosts,
    required this.onPostClicked,
  });

  final String userProfileImage;
  final List<UserPostModel> userPosts;

  final void Function(String) onPostClicked;

  @override
  List<Object> get props => [
        userProfileImage,
        userPosts,
      ];
}
