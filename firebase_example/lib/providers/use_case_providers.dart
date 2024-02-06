import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/create_post/domain/create_post_use_case.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_use_case.dart';
import 'package:clean_framework_firebase_example/features/navigation/domain/navigation_use_case.dart';
import 'package:clean_framework_firebase_example/features/profile/domain/profile_use_case.dart';

final homeUseCaseProvider = UseCaseProvider(
  HomeUseCase.new,
);

final profileUseCaseProvider = UseCaseProvider(
  ProfileUseCase.new,
);

final createPostUseCaseProvider = UseCaseProvider(
  CreatePostUseCase.new,
);

final navigationUseCaseProvider = UseCaseProvider(
  NavigationUseCase.new,
);
