import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/core/models/user_model.dart';

class ProfileIconWidget extends StatelessWidget {
  const ProfileIconWidget({
    super.key,
    required this.user,
    this.width = 40.0,
    this.height = 40.0,
  });

  final UserModel user;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        width: width,
        height: height,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.network(
          user.profileImageLink,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
