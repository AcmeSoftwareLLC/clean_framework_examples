import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/create_post/domain/create_post_use_case.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_use_case.dart';
import 'package:clean_framework_firebase_example/features/navigation/domain/navigation_use_case.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_use_case.dart';

final homeUseCaseProvider = UseCaseProvider(
  HomeUseCase.new,
);

final createPostUseCaseProvider = UseCaseProvider(
  CreatePostUseCase.new,
);

final navigationUseCaseProvider = UseCaseProvider(
  NavigationUseCase.new,
);

final viewPostUseCaseProvider = UseCaseProvider(
  ViewPostUseCase.new,
);
