import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_domain_inputs.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_domain_models.dart';
import 'package:clean_framework_firebase_example/features/home/domain/home_entity.dart';
import 'package:clean_framework_firebase_example/features/home/models/user_model.dart';
import 'package:clean_framework_firebase_example/features/home/models/user_post_model.dart';

class HomeUseCase extends UseCase<HomeEntity> {
  HomeUseCase()
      : super(
          entity: const HomeEntity(),
          transformers: [
            HomeDomainToUIModelTransformer(),
          ],
        );

  Future<void> getPosts() async {
    await request<HomeGetPostsSuccessDomainInput>(
      const HomeGetPostsDomainToGatewayModel(),
      onSuccess: (success) {
        return entity;
      },
      onFailure: (failure) {
        return entity;
      },
    );
  }
}

class HomeDomainToUIModelTransformer
    extends DomainModelTransformer<HomeEntity, HomeDomainToUIModel> {
  @override
  HomeDomainToUIModel transform(HomeEntity entity) {
    return HomeDomainToUIModel(
      user: entity.user,
      userPosts: entity.userPosts,
    );
  }
}
