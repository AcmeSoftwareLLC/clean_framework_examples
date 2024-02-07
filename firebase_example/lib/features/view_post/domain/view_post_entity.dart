import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_model.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

class ViewPostEntity extends Entity {
  const ViewPostEntity({
    this.postId = '',
    this.post = const UserPostModel(
        postingUser: UserModel(
          profileImageLink: '',
          userName: '',
          verified: false,
        ),
        postImageLink: '',
        postLikes: 0,
        postComment: '',
        postDate: ''),
  });

  final String postId;
  final UserPostModel post;

  @override
  ViewPostEntity copyWith({
    String? postId,
    UserPostModel? post,
  }) {
    return ViewPostEntity(
      postId: postId ?? this.postId,
      post: post ?? this.post,
    );
  }

  @override
  List<Object?> get props => [
        postId,
        post,
      ];
}
