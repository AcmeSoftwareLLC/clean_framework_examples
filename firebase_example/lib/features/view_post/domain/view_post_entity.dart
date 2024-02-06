import 'package:clean_framework/clean_framework.dart';

class ViewPostEntity extends Entity {
  const ViewPostEntity({
    this.posterUsername = '',
    this.posterProfileImage = '',
    this.posterVerified = false,
    this.postImage = '',
    this.postDescription = '',
    this.postLikes = 0,
    this.postDate = '',
  });

  final String posterUsername;
  final String posterProfileImage;
  final bool posterVerified;

  final String postImage;
  final String postDescription;
  final int postLikes;
  final String postDate;

  @override
  ViewPostEntity copyWith({
    String? posterUsername,
    String? posterProfileImage,
    bool? posterVerified,
    String? postImage,
    String? postDescription,
    int? postLikes,
    String? postDate,
  }) {
    return ViewPostEntity(
      posterUsername: posterUsername ?? this.posterUsername,
      posterProfileImage: posterProfileImage ?? this.posterProfileImage,
      posterVerified: posterVerified ?? this.posterVerified,
      postImage: postImage ?? this.postImage,
      postDescription: postDescription ?? this.postDescription,
      postLikes: postLikes ?? this.postLikes,
      postDate: postDate ?? this.postDate,
    );
  }

  @override
  List<Object?> get props => [
        posterUsername,
        posterProfileImage,
        posterVerified,
        postImage,
        postDescription,
        postLikes,
        postDate,
      ];
}
