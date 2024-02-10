import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FirebaseLoadingWidget extends StatefulWidget {
  const FirebaseLoadingWidget({
    super.key,
  });

  @override
  State<FirebaseLoadingWidget> createState() => _FirebaseLoadingWidgetState();
}

class _FirebaseLoadingWidgetState extends State<FirebaseLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 32.0),
      child: Center(
        child: LoadingAnimationWidget.discreteCircle(
            color: Colors.blue, size: 45.0),
      ),
    );
  }
}
