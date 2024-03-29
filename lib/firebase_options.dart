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
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBUc1tOxTQiwFjB3P5WAlQArw3uMxRwmog',
    appId: '1:831506386495:web:56ba4b434fe22e70ed728a',
    messagingSenderId: '831506386495',
    projectId: 'registration-app-7d7d1',
    authDomain: 'registration-app-7d7d1.firebaseapp.com',
    storageBucket: 'registration-app-7d7d1.appspot.com',
    measurementId: 'G-TBCGWW8GK6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7_sDlqPxVB7KbRSLQD0ovzH9Kusa2a2E',
    appId: '1:831506386495:android:65fd994c72542091ed728a',
    messagingSenderId: '831506386495',
    projectId: 'registration-app-7d7d1',
    storageBucket: 'registration-app-7d7d1.appspot.com',
  );
}
