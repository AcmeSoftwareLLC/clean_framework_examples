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
    // entity = entity.copyWith(
    //   user: const UserModel(
    //     userName: 'giovann_2',
    //     profileImageLink:
    //         'https://images.unsplash.com/photo-1526142805342-8c7badb164e0?w=500&h=500',
    //     verified: false,
    //   ),
    //   userPosts: [
    //     const UserPostModel(
    //       postingUser: UserModel(
    //         userName: 'jerry',
    //         profileImageLink:
    //             'https://images.unsplash.com/photo-1526142805342-8c7badb164e0?w=500&h=500',
    //         verified: true,
    //       ),
    //       postImageLink:
    //           'https://images.unsplash.com/photo-1471180625745-944903837c22?w=1280&h=720',
    //       postLikes: 15837,
    //       postComment: 'Really cool.',
    //       postDate: 'January 26, 2019',
    //     ),
    //   ],
    // );
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
