import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/widgets.dart';

class CreatePostViewModel extends ViewModel {
  const CreatePostViewModel({
    required this.posterUsername,
    required this.posterProfileImage,
    required this.posterVerified,
    required this.postImage,
    required this.postDescription,
    required this.postLikes,
    required this.postDate,
    required this.onUsernameChanged,
    required this.onProfileImageChanged,
    required this.onVerifiedChanged,
    required this.onPostImageChanged,
    required this.onPostDescriptionChanged,
    required this.onPostLikesChanged,
    required this.onPostDateChanged,
    required this.onAddPost,
  });

  final String posterUsername;
  final String posterProfileImage;
  final bool posterVerified;

  final String postImage;
  final String postDescription;
  final int postLikes;
  final String postDate;

  final ValueChanged<String> onUsernameChanged;
  final ValueChanged<String> onProfileImageChanged;
  final ValueChanged<bool> onVerifiedChanged;

  final ValueChanged<String> onPostImageChanged;
  final ValueChanged<String> onPostDescriptionChanged;
  final ValueChanged<int> onPostLikesChanged;
  final ValueChanged<String> onPostDateChanged;

  final void Function() onAddPost;

  @override
  List<Object?> get props => [
        posterUsername,
        posterProfileImage,
        posterVerified,
        postImage,
        postDescription,
        postLikes,
        postDate,
      ];
}
