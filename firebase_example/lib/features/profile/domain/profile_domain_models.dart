import 'package:clean_framework/clean_framework.dart';

class ProfileDomainToUIModel extends DomainModel {
  const ProfileDomainToUIModel({
    required this.placeholder,
  });

  final String placeholder;

  @override
  List<Object?> get props => [
        placeholder,
      ];
}
