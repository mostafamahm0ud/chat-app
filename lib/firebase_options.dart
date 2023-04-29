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
    apiKey: 'AIzaSyDz9ARv-GETEy45ck0X7kiO8vDpia76sBM',
    appId: '1:477793894684:web:10ae99059522eacf877ad9',
    messagingSenderId: '477793894684',
    projectId: 'chat-app-9f790',
    authDomain: 'chat-app-9f790.firebaseapp.com',
    storageBucket: 'chat-app-9f790.appspot.com',
    measurementId: 'G-3CPTWCFZF0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqNk7ixWP-6R4pm6ROp7VSzQ2grcAMIWQ',
    appId: '1:477793894684:android:28119352bc575f5a877ad9',
    messagingSenderId: '477793894684',
    projectId: 'chat-app-9f790',
    storageBucket: 'chat-app-9f790.appspot.com',
  );
}
