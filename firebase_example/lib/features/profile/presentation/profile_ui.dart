import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/core/theme/firebase_example_theme.dart';
import 'package:clean_framework_firebase_example/core/widgets/misc/misc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/features/profile/presentation/profile_presenter.dart';
import 'package:clean_framework_firebase_example/features/profile/presentation/profile_view_model.dart';

class ProfileUI extends UI<ProfileViewModel> {
  ProfileUI({
    super.key,
  });

  @override
  ProfilePresenter create(WidgetBuilder builder) {
    return ProfilePresenter(builder: builder);
  }

  @override
  Widget build(BuildContext context, ProfileViewModel viewModel) {
    return GestureDetector(
      child: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   'Profile',
                  //   style: FlutterFlowTheme.of(context).displayLarge.override(
                  //         fontFamily: 'Outfit',
                  //         color: FlutterFlowTheme.of(context).primaryText,
                  //         fontWeight: FontWeight.w500,
                  //       ),
                  // ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: FirebaseExampleTheme.of(context)
                            .secondaryBackground,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1523371542221-b2965445c8f3?w=512&h=512',
                          width: 80.0,
                          height: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'John Doe',
                    style: FirebaseExampleTheme.of(context)
                        .headlineMedium
                        .override(
                          fontFamily: 'Outfit',
                          color: FirebaseExampleTheme.of(context).primaryText,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Photographer | Traveler | Foodie',
                    style: FirebaseExampleTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          color: FirebaseExampleTheme.of(context).secondaryText,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 16.0, 16.0, 16.0),
                    child: CustomButtonWidget(
                      onPressed: () {
                        //
                      },
                      text: 'Edit Profile',
                      options: CustomButtonOptions(
                        width: 150.0,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        iconPadding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 0.0),
                        color: FirebaseExampleTheme.of(context).primary,
                        textStyle:
                            FirebaseExampleTheme.of(context).bodySmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FirebaseExampleTheme.of(context)
                            .secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1489549132488-d00b7eee80f1?w=1280&h=720',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FirebaseExampleTheme.of(context)
                            .secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1516100882582-96c3a05fe590?w=1280&h=720',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FirebaseExampleTheme.of(context)
                            .secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1418854982207-12f710b74003?w=1280&h=720',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FirebaseExampleTheme.of(context)
                            .secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1487222477894-8943e31ef7b2?w=1280&h=720',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FirebaseExampleTheme.of(context)
                            .secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1577084381380-3b9ea4153664?w=1280&h=720',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        8.0, 8.0, 8.0, 8.0),
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FirebaseExampleTheme.of(context)
                            .secondaryBackground,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1517963879433-6ad2b056d712?w=1280&h=720',
                          width: 100.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Followed by 1.2K people',
                    style: FirebaseExampleTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          color: FirebaseExampleTheme.of(context).secondaryText,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Followers 2.5K',
                    style: FirebaseExampleTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          color: FirebaseExampleTheme.of(context).secondaryText,
                        ),
                  ),
                  Text(
                    'Following 500',
                    style: FirebaseExampleTheme.of(context).bodySmall.override(
                          fontFamily: 'Readex Pro',
                          color: FirebaseExampleTheme.of(context).secondaryText,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
