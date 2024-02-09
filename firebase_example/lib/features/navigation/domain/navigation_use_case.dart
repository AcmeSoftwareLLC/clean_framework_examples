import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework_firebase_example/features/navigation/domain/navigation_domain_inputs.dart';
import 'package:clean_framework_firebase_example/features/navigation/domain/navigation_domain_models.dart';
import 'package:clean_framework_firebase_example/features/navigation/domain/navigation_entity.dart';

class NavigationUseCase extends UseCase<NavigationEntity> {
  NavigationUseCase()
      : super(
          entity: const NavigationEntity(),
          transformers: [
            NavigationDomainToUIModelTransformer(),
            NavigationPostIdDomainInputTransformer(),
          ],
        );

  Future<void> selectPage(int index) async {
    entity = entity.copyWith(currentPageIndex: index);
  }
}

class NavigationDomainToUIModelTransformer extends DomainModelTransformer<
    NavigationEntity, NavigationDomainToUIModel> {
  @override
  NavigationDomainToUIModel transform(NavigationEntity entity) {
    return NavigationDomainToUIModel(
      currentPageIndex: entity.currentPageIndex,
      currentPageArgs: entity.currentPageArgs,
    );
  }
}

class NavigationPostIdDomainInputTransformer extends DomainInputTransformer<
    NavigationEntity, NavigationPostIdDomainInput> {
  @override
  NavigationEntity transform(
      NavigationEntity entity, NavigationPostIdDomainInput input) {
    return entity.copyWith(
      currentPageIndex: input.postId == '' ? entity.currentPageIndex : 2,
      currentPageArgs: input.postId,
    );
  }
}
