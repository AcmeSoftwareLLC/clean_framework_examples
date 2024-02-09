import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

class ViewPostSuccessDomainInput extends SuccessDomainInput {
  ViewPostSuccessDomainInput({
    required this.post,
  });

  final UserPostModel post;
}

class PostCommentSuccessDomainInput extends SuccessDomainInput {
  PostCommentSuccessDomainInput();
}
