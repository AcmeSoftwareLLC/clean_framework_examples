import 'package:clean_framework/clean_framework.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.userName,
    required this.profileImageLink,
    required this.verified,
  });

  final String userName;
  final String profileImageLink;
  final bool verified;

  @override
  List<Object?> get props => [
        userName,
        profileImageLink,
        verified,
      ];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    Deserializer deserializer = Deserializer(json);

    return UserModel(
      userName: deserializer.getString('user_name'),
      profileImageLink: deserializer.getString('profile_image'),
      verified: deserializer.getBool('verified_user'),
    );
  }

  Map<String, dynamic> toJson() => {
        'profile_image': profileImageLink,
        'user_name': userName,
        'verified_user': verified,
      };
}
