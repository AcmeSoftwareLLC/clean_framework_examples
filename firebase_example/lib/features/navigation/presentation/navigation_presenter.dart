import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/navigation/domain/navigation_domain_models.dart';
import 'package:clean_framework_firebase_example/features/navigation/domain/navigation_use_case.dart';
import 'package:clean_framework_firebase_example/features/navigation/presentation/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/providers.dart';

class NavigationPresenter extends Presenter<NavigationViewModel,
    NavigationDomainToUIModel, NavigationUseCase> {
  NavigationPresenter({
    required super.builder,
    super.key,
  }) : super(provider: navigationUseCaseProvider);

  @override
  NavigationViewModel createViewModel(
      NavigationUseCase useCase, NavigationDomainToUIModel domainModel) {
    return NavigationViewModel(
      pageIndex: domainModel.currentPageIndex,
      pageArgs: domainModel.currentPageArgs,
      onPageChanged: useCase.selectPage,
    );
  }

  @override
  void onLayoutReady(BuildContext context, NavigationUseCase useCase) {
    useCase.selectPage(0);
  }
}
