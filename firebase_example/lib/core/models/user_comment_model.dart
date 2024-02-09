import 'package:clean_framework/clean_framework.dart';

class UserCommentModel extends Equatable {
  const UserCommentModel({
    required this.userName,
    required this.message,
  });

  final String userName;
  final String message;

  @override
  List<Object?> get props => [
        userName,
        message,
      ];

  factory UserCommentModel.fromJson(Map<String, dynamic> json) {
    Deserializer deserializer = Deserializer(json);

    return UserCommentModel(
      userName: deserializer.getString('user_name'),
      message: deserializer.getString('message'),
    );
  }

  Map<String, dynamic> toJson() => {
        'user_name': userName,
        'message': message,
      };
}
