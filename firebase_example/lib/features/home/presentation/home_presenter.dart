import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/widgets/misc/firebase_toast.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_entity.dart';
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
      loadingState: domainModel.loadingState,
      userProfileImage: domainModel.user.profileImageLink,
      userPosts: domainModel.userPosts,
      onPostClicked: (id) => useCase.navigateToPost(id),
      onDeletePost: (id) => useCase.deletePost(id),
    );
  }

  @override
  void onLayoutReady(BuildContext context, HomeUseCase useCase) {
    useCase.navigateToPost('');
    useCase.getPosts();
  }

  @override
  void onDomainModelUpdate(
      BuildContext context, HomeDomainToUIModel domainModel) {
    if (domainModel.deletePostState == DeletePostState.success) {
      const FirebaseToast(
        title: 'Post deleted successfully',
      ).show(context);
    } else if (domainModel.deletePostState == DeletePostState.failure) {
      const FirebaseToast(
        title: 'Something went wrong',
      ).show(context);
    }
  }
}
