import 'package:clean_framework/clean_framework.dart';

class NavigationEntity extends Entity {
  const NavigationEntity({
    this.currentPageIndex = 0,
    this.currentPageArgs = '',
  });

  final int currentPageIndex;
  final String currentPageArgs;

  @override
  NavigationEntity copyWith({
    int? currentPageIndex,
    String? currentPageArgs,
  }) {
    return NavigationEntity(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      currentPageArgs: currentPageArgs ?? this.currentPageArgs,
    );
  }

  @override
  List<Object?> get props => [
        currentPageIndex,
        currentPageArgs,
      ];
}
