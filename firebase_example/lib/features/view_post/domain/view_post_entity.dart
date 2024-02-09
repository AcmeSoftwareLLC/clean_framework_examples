import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_model.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

enum PostLoadState {
  loading,
  successful,
  failed,
}

enum PostCommentState {
  none,
  successful,
  failed,
}

class ViewPostEntity extends Entity {
  const ViewPostEntity({
    this.postId = '',
    this.post = const UserPostModel(
        comments: [],
        postingUser: UserModel(
          profileImageLink: '',
          userName: '',
          verified: false,
        ),
        postImageLink: '',
        postLikes: 0,
        postComment: '',
        postDate: ''),
    this.loadState = PostLoadState.loading,
    this.commentState = PostCommentState.none,
    this.userComment = '',
  });

  final String postId;
  final UserPostModel post;

  final PostLoadState loadState;
  final PostCommentState commentState;

  final String userComment;

  @override
  ViewPostEntity copyWith({
    String? postId,
    UserPostModel? post,
    PostLoadState? loadState,
    PostCommentState? commentState,
    String? userComment,
  }) {
    return ViewPostEntity(
      postId: postId ?? this.postId,
      post: post ?? this.post,
      loadState: loadState ?? this.loadState,
      commentState: commentState ?? this.commentState,
      userComment: userComment ?? this.userComment,
    );
  }

  @override
  List<Object?> get props => [
        postId,
        post,
        loadState,
        commentState,
        userComment,
      ];
}
