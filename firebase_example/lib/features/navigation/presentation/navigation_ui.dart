import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/theme/firebase_example_theme.dart';
import 'package:clean_framework_firebase_example/core/widgets/example_nav_bar.dart';
import 'package:clean_framework_firebase_example/features/create_post/presentation/create_post_ui.dart';
import 'package:clean_framework_firebase_example/features/home/presentation/home_ui.dart';
import 'package:clean_framework_firebase_example/features/navigation/presentation/navigation_presenter.dart';
import 'package:clean_framework_firebase_example/features/navigation/presentation/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/core/widgets/example_app_bar.dart';

class NavigationUI extends UI<NavigationViewModel> {
  NavigationUI({
    super.key,
  });

  @override
  NavigationPresenter create(WidgetBuilder builder) {
    return NavigationPresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, NavigationViewModel viewModel) {
    return GestureDetector(
      child: Scaffold(
        appBar: const ExampleAppBar(
          pageName: 'Clean Framework Firebase',
        ),
        bottomNavigationBar: ExampleNavBar(
          pageIndex: viewModel.pageIndex,
          onDestinationSelected: (destination) =>
              viewModel.onPageChanged(destination),
        ),
        key: const Key("scaffold"),
        backgroundColor: FirebaseExampleTheme.of(context).primaryBackground,
        body: _getCurrentUI(viewModel.pageIndex),
      ),
    );
  }

  Widget _getCurrentUI(int pageIndex) {
    if (pageIndex == 0) {
      return HomeUI();
    } else if (pageIndex == 1) {
      return CreatePostUI();
    } else {
      return HomeUI();
    }
  }
}
