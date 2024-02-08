import 'package:clean_framework/clean_framework.dart';

class NavigationDomainToUIModel extends DomainModel {
  const NavigationDomainToUIModel({
    required this.currentPageIndex,
    required this.currentPageArgs,
  });

  final int currentPageIndex;
  final String currentPageArgs;

  @override
  List<Object?> get props => [
        currentPageIndex,
        currentPageArgs,
      ];
}
