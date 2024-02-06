import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/create_post/external_interface/create_post_gateway.dart';
import 'package:clean_framework_firebase_example/features/home/external_interface/home_get_posts_gateway.dart';
import 'package:clean_framework_firebase_example/providers/use_case_providers.dart';

final getPostsGatewayProvider = GatewayProvider(
  HomeGetPostsGateway.new,
  useCases: [
    homeUseCaseProvider,
  ],
);

final createPostGatewayProvider = GatewayProvider(
  CreatePostGateway.new,
  useCases: [
    createPostUseCaseProvider,
  ],
);
