import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/models/user_post_model.dart';

class ViewPostViewModel extends ViewModel {
  const ViewPostViewModel({
    required this.post,
  });

  final UserPostModel post;

  @override
  List<Object?> get props => [
        post,
      ];
}
