import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/features/profile/domain/profile_domain_models.dart';
import 'package:clean_framework_firebase_example/features/profile/domain/profile_use_case.dart';
import 'package:clean_framework_firebase_example/features/profile/presentation/profile_view_model.dart';
import 'package:clean_framework_firebase_example/providers.dart';

class ProfilePresenter extends Presenter<ProfileViewModel,
    ProfileDomainToUIModel, ProfileUseCase> {
  ProfilePresenter({
    required super.builder,
    super.key,
  }) : super(provider: profileUseCaseProvider);

  @override
  ProfileViewModel createViewModel(
      ProfileUseCase useCase, ProfileDomainToUIModel domainModel) {
    return ProfileViewModel(
      placeholder: domainModel.placeholder,
    );
  }

  @override
  void onLayoutReady(BuildContext context, ProfileUseCase useCase) {
    useCase.getTheme();
  }
}
