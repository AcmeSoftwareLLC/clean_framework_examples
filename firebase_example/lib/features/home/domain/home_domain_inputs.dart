import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/home/models/user_post_model.dart';

class HomeGetPostsSuccessDomainInput extends SuccessDomainInput {
  HomeGetPostsSuccessDomainInput({
    required this.posts,
  });

  final List<UserPostModel> posts;
}
