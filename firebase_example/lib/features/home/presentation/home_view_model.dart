import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/home/models/user_post_model.dart';

class HomeViewModel extends ViewModel {
  const HomeViewModel({
    required this.userProfileImage,
    required this.userPosts,
  });

  final String userProfileImage;
  final List<UserPostModel> userPosts;

  @override
  List<Object> get props => [
        userProfileImage,
        userPosts,
      ];
}
