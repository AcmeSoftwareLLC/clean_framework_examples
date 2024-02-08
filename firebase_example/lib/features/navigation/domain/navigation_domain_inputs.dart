import 'package:clean_framework/clean_framework.dart';

class NavigationPostIdDomainInput extends DomainInput {
  NavigationPostIdDomainInput({
    required this.postId,
  });

  final String postId;

  @override
  List<Object?> get props => [
        postId,
      ];
}
