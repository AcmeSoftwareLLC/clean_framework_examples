import 'package:clean_framework/clean_framework.dart';

class ProfileViewModel extends ViewModel {
  const ProfileViewModel({
    required this.placeholder,
  });

  final String placeholder;

  @override
  List<Object> get props => [
        placeholder,
      ];
}
