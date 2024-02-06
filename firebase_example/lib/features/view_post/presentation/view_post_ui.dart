import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/view_post/presentation/view_post_presenter.dart';
import 'package:clean_framework_firebase_example/features/view_post/presentation/view_post_view_model.dart';
import 'package:flutter/material.dart';

class ViewPostUI extends UI<ViewPostViewModel> {
  ViewPostUI({
    super.key,
  });

  @override
  ViewPostPresenter create(WidgetBuilder builder) {
    return ViewPostPresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, ViewPostViewModel viewModel) {
    return GestureDetector();
  }
}
