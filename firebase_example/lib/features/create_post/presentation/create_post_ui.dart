import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/theme/firebase_example_theme.dart';
import 'package:clean_framework_firebase_example/core/widgets/misc/misc_widgets.dart';
import 'package:clean_framework_firebase_example/features/create_post/presentation/create_post_presenter.dart';
import 'package:clean_framework_firebase_example/features/create_post/presentation/create_post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreatePostUI extends UI<CreatePostViewModel> {
  CreatePostUI({
    super.key,
  });

  @override
  CreatePostPresenter create(WidgetBuilder builder) {
    return CreatePostPresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, CreatePostViewModel viewModel) {
    return GestureDetector(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Create new Post',
                style: FirebaseExampleTheme.of(context).headlineSmall,
              ),
              const Divider(
                height: 25.0,
                thickness: 1.0,
              ),
              Text(
                'User Info',
                style: FirebaseExampleTheme.of(context).bodyLarge,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  16.0,
                  16.0,
                  16.0,
                  16.0,
                ),
                child: TextField(
                  style: FirebaseExampleTheme.of(context).bodySmall,
                  onChanged: viewModel.onUsernameChanged,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Poster username',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  16.0,
                  16.0,
                  16.0,
                  16.0,
                ),
                child: TextField(
                  style: FirebaseExampleTheme.of(context).bodySmall,
                  onChanged: viewModel.onProfileImageChanged,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Poster profile image link',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Is user verified?',
                    style: FirebaseExampleTheme.of(context).bodyLarge,
                  ),
                  Checkbox(
                    checkColor: Colors.black,
                    fillColor: const MaterialStatePropertyAll(Colors.white),
                    value: viewModel.posterVerified,
                    onChanged: (value) => viewModel.onVerifiedChanged(value!),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                'Post Info',
                style: FirebaseExampleTheme.of(context).bodyLarge,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  16.0,
                  16.0,
                  16.0,
                  16.0,
                ),
                child: TextField(
                  style: FirebaseExampleTheme.of(context).bodySmall,
                  onChanged: viewModel.onPostImageChanged,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Image link',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  16.0,
                  16.0,
                  16.0,
                  16.0,
                ),
                child: TextField(
                  style: FirebaseExampleTheme.of(context).bodySmall,
                  onChanged: viewModel.onPostDescriptionChanged,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Post description',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  16.0,
                  16.0,
                  16.0,
                  16.0,
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  style: FirebaseExampleTheme.of(context).bodySmall,
                  onChanged: (value) =>
                      viewModel.onPostLikesChanged(int.tryParse(value) ?? 0),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number of likes',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  16.0,
                  16.0,
                  16.0,
                  16.0,
                ),
                child: TextField(
                  style: FirebaseExampleTheme.of(context).bodySmall,
                  onChanged: viewModel.onPostDateChanged,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date',
                  ),
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              CustomButtonWidget(
                onPressed: viewModel.onAddPost,
                text: 'Add Post',
                options: CustomButtonOptions(
                  width: 175.0,
                  height: 50.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                  ),
                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    0.0,
                    0.0,
                    0.0,
                  ),
                  color: FirebaseExampleTheme.of(context).primary,
                  textStyle:
                      FirebaseExampleTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                          ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
