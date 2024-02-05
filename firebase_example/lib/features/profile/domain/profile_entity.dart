import 'package:clean_framework/clean_framework.dart';

class ProfileEntity extends Entity {
  const ProfileEntity({
    this.placeholder = '',
  });

  final String placeholder;

  @override
  ProfileEntity copyWith({
    String? placeholder,
  }) {
    return ProfileEntity(
      placeholder: placeholder ?? this.placeholder,
    );
  }

  @override
  List<Object?> get props => [
        placeholder,
      ];
}
