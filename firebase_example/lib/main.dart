import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework_firebase_example/app/firebase_example_app.dart';
import 'package:clean_framework_firebase_example/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FirebaseExampleApp());
}
