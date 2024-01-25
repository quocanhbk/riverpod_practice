// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-4mzTT4m5IiEXfipGSuTujh743BOj3wU',
    appId: '1:544386222363:android:5ef16f28d81df3eadc6bbe',
    messagingSenderId: '544386222363',
    projectId: 'qabk17-instagram-clone',
    storageBucket: 'qabk17-instagram-clone.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDTeWZNXPqgHIELd6E8FziSWTOPaDzYEtI',
    appId: '1:544386222363:ios:dabe3ffae5bb71fddc6bbe',
    messagingSenderId: '544386222363',
    projectId: 'qabk17-instagram-clone',
    storageBucket: 'qabk17-instagram-clone.appspot.com',
    iosBundleId: 'com.example.riverpodPractice',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDTeWZNXPqgHIELd6E8FziSWTOPaDzYEtI',
    appId: '1:544386222363:ios:5f8fd09d561417eedc6bbe',
    messagingSenderId: '544386222363',
    projectId: 'qabk17-instagram-clone',
    storageBucket: 'qabk17-instagram-clone.appspot.com',
    iosBundleId: 'com.example.riverpodPractice.RunnerTests',
  );
}