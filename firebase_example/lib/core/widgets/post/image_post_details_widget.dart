import 'package:clean_framework_firebase_example/core/theme/firebase_example_theme.dart';
import 'package:clean_framework_firebase_example/core/widgets/misc/misc_widgets.dart';
import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:flutter/material.dart';

class ImagePostDetailsWidget extends StatelessWidget {
  const ImagePostDetailsWidget({
    super.key,
    required this.onDeleteClicked,
  });

  final void Function() onDeleteClicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
      ),
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'Post Options',
            style: FirebaseExampleTheme.of(context).headlineSmall,
          ),
          const SizedBox(
            height: 32.0,
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    0.0,
                    0.0,
                    16.0,
                  ),
                  child: CustomButtonWidget(
                    onPressed: () {},
                    text: 'Edit',
                    iconData: Icons.edit,
                    options: CustomButtonOptions(
                      width: 175.0,
                      height: 45.0,
                      color: FirebaseExampleTheme.of(context).secondary,
                      textStyle:
                          FirebaseExampleTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      // elevation: 15.0,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                    0.0,
                    0.0,
                    0.0,
                    16.0,
                  ),
                  child: CustomButtonWidget(
                    onPressed: () {
                      onDeleteClicked();
                      context.router.pop();
                    },
                    text: 'Delete',
                    iconData: Icons.delete,
                    options: CustomButtonOptions(
                      width: 175.0,
                      height: 45.0,
                      color: FirebaseExampleTheme.of(context).error,
                      textStyle:
                          FirebaseExampleTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                              ),
                      // elevation: 15.0,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
