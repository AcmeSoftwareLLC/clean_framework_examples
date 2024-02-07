import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_domain_models.dart';
import 'package:clean_framework_firebase_example/features/view_post/domain/view_post_use_case.dart';
import 'package:clean_framework_firebase_example/features/view_post/presentation/view_post_view_model.dart';
import 'package:clean_framework_firebase_example/providers.dart';
import 'package:flutter/widgets.dart';

class ViewPostPresenter extends Presenter<ViewPostViewModel,
    ViewPostDomainToUIModel, ViewPostUseCase> {
  ViewPostPresenter({
    required super.builder,
    super.key,
  }) : super(provider: viewPostUseCaseProvider);

  @override
  void onLayoutReady(BuildContext context, ViewPostUseCase useCase) {
    useCase.getPost('Eu3JVnrFO3s65rRHFWmG');
  }

  @override
  ViewPostViewModel createViewModel(
      ViewPostUseCase useCase, ViewPostDomainToUIModel domainModel) {
    return ViewPostViewModel();
  }
}
