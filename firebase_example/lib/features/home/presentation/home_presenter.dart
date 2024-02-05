import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_domain_models.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_use_case.dart';
import 'package:clean_framework_firebase_example/features/home/presentation/home_view_model.dart';
import 'package:clean_framework_firebase_example/providers.dart';

class HomePresenter
    extends Presenter<HomeViewModel, HomeDomainToUIModel, HomeUseCase> {
  HomePresenter({
    required super.builder,
    super.key,
  }) : super(provider: homeUseCaseProvider);

  @override
  HomeViewModel createViewModel(
      HomeUseCase useCase, HomeDomainToUIModel domainModel) {
    return HomeViewModel(
      userProfileImage: domainModel.user.profileImageLink,
      userPosts: domainModel.userPosts,
    );
  }

  @override
  void onLayoutReady(BuildContext context, HomeUseCase useCase) {
    useCase.getPosts();
  }
}
