import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/features/home/models/user_model.dart';
import 'package:clean_framework_firebase_example/router.dart';

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
      onPressed: () {
        context.router.go(
          Routes.profile,
        );
      },
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
