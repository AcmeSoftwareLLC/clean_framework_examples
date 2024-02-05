import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_use_case.dart';
import 'package:clean_framework_firebase_example/features/profile/domain/profile_use_case.dart';

final homeUseCaseProvider = UseCaseProvider(
  HomeUseCase.new,
);

final profileUseCaseProvider = UseCaseProvider(
  ProfileUseCase.new,
);
