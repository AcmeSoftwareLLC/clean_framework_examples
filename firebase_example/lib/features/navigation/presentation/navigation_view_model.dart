import 'package:clean_framework/clean_framework.dart';

class NavigationViewModel extends ViewModel {
  const NavigationViewModel({
    required this.pageIndex,
    required this.pageArgs,
    required this.onPageChanged,
  });

  final int pageIndex;
  final String pageArgs;

  final void Function(int) onPageChanged;

  @override
  List<Object> get props => [
        pageIndex,
        pageArgs,
      ];
}
