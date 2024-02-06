import 'package:clean_framework/clean_framework.dart';

class NavigationEntity extends Entity {
  const NavigationEntity({
    this.currentPageIndex = 0,
  });

  final int currentPageIndex;

  @override
  NavigationEntity copyWith({
    int? currentPageIndex,
  }) {
    return NavigationEntity(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }

  @override
  List<Object?> get props => [
        currentPageIndex,
      ];
}
