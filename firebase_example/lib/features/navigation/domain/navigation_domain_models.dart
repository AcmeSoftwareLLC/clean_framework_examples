import 'package:clean_framework/clean_framework.dart';

class NavigationDomainToUIModel extends DomainModel {
  const NavigationDomainToUIModel({
    required this.currentPageIndex,
  });

  final int currentPageIndex;

  @override
  List<Object?> get props => [
        currentPageIndex,
      ];
}
