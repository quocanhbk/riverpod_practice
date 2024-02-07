import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
  const Strings._();

  static const allowLikesTitle = 'Allow likes';
  static const allowLikesDescription = 'Allow others to like your posts';
  static const allowLikesStorageKey = 'allow_likes';

  static const allowCommentsTitle = 'Allow comments';
  static const allowCommentsDescription =
      'Allow others to comment on your posts';
  static const allowCommentsStorageKey = 'allow_comments';

  static const comment = 'comment';

  static const loading = 'Loading...';

  static const person = 'person';
  static const people = 'people';
  static const likedThis = 'liked this';

  static const delete = 'Delete';
  static const sureToDelete = 'Are you sure you want to delete this';

  static const logOut = 'Log out';
  static const logOutDescription = 'Are you sure you want to log out';
}
