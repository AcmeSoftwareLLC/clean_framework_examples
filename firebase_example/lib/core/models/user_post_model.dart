import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_model.dart';

class UserPostModel extends Equatable {
  const UserPostModel({
    required this.postingUser,
    required this.postImageLink,
    required this.postLikes,
    required this.postComment,
    required this.postDate,
    this.postId = '',
  });

  final UserModel postingUser;
  final String postImageLink;
  final int postLikes;
  final String postComment;
  final String postDate;
  final String postId;

  @override
  List<Object?> get props => [
        postingUser,
        postImageLink,
        postLikes,
        postComment,
        postDate,
        postId,
      ];

  factory UserPostModel.fromJson(Map<String, dynamic> json) {
    Deserializer deserializer = Deserializer(json);

    return UserPostModel(
      postingUser: UserModel.fromJson(
        json['poster'],
      ),
      postImageLink: deserializer.getString('image'),
      postLikes: deserializer.getInt('likes'),
      postComment: deserializer.getString('description'),
      postDate: deserializer.getString('date'),
      postId: deserializer.getString('id'),
    );
  }

  Map<String, dynamic> toJson() => {
        'date': postDate,
        'description': postComment,
        'image': postImageLink,
        'likes': postLikes,
        'poster': postingUser.toJson(),
      };
}
