import 'package:flutter/foundation.dart' show immutable;

@immutable
class Strings {
  const Strings._();

  static const appname = 'Visual World';
  static const welcomeToAppName = 'Welcome to $appname';
  static const noHaveNoPosts = 'You have no posts';
  static const noPostsAvailable = 'No posts available';
  static const enterYourSearchTerm = 'Enter your search term';

  static const facebook = 'Facebook';
  static const facebookSignUpUrl = 'https://www.facebook.com/signup';
  static const google = 'Google';
  static const googleSignUpUrl = 'https://www.google.com/signup';
  static const loginWithGoogle = 'Login with Google';
  static const loginWithFacebook = 'Login with Facebook';

  static const logIntoYourAccount =
      'Log into your account using one of the options below.';

  static const comments = 'Comments';
  static const writeYourCommentHere = 'Write your comment here...';
  static const checkOutThisPost = 'Check out this post!';
  static const postDetails = 'Post Details';
  static const post = 'Post';

  static const createNewPost = 'Create New Post';
  static const pleaseWriteYourMessageHere = 'Please write your message here...';
  static const noCommentsYet = 'No comments yet';

  static const dontHaveAnAccount = 'Don\'t have an account?\n';
  static const signUp = 'Sign up on ';
  static const orCreateAnAccountOn = ' or create an account on ';
}
