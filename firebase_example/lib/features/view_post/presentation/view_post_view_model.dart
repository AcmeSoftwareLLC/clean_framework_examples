import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_entity.dart';

class ViewPostViewModel extends ViewModel {
  const ViewPostViewModel({
    required this.post,
    required this.loadState,
    required this.userComment,
    required this.onCommentChanged,
    required this.onSendComment,
  });

  final UserPostModel post;
  final PostLoadState loadState;

  final String userComment;

  final void Function(String) onCommentChanged;
  final void Function() onSendComment;

  @override
  List<Object?> get props => [
        post,
        loadState,
        userComment,
      ];
}
