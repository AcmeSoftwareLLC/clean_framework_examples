import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/profile/domain/profile_domain_models.dart';
import 'package:clean_framework_firebase_example/features/profile/domain/profile_entity.dart';

class ProfileUseCase extends UseCase<ProfileEntity> {
  ProfileUseCase()
      : super(
          entity: const ProfileEntity(),
          transformers: [
            ProfileDomainToUIModelTransformer(),
          ],
        );

  Future<void> getTheme() async {}
}

class ProfileDomainToUIModelTransformer
    extends DomainModelTransformer<ProfileEntity, ProfileDomainToUIModel> {
  @override
  ProfileDomainToUIModel transform(ProfileEntity entity) {
    return ProfileDomainToUIModel(
      placeholder: entity.placeholder,
    );
  }
}
