import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firestore/clean_framework_firestore.dart';
import 'package:clean_framework_firebase_example/providers/gateway_providers.dart';

final firebaseExternalInterfaceProvider = ExternalInterfaceProvider(
  FirebaseExternalInterface.new,
  gateways: [
    getPostsGatewayProvider,
    deletePostGatewayProvider,
    createPostGatewayProvider,
    viewPostGatewayProvider,
    viewPostCommentGatewayProvider,
  ],
);
