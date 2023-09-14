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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAOZs-Id5wZzhg-lxXW-kMt2zGuXOFgvAI',
    appId: '1:850573478366:web:2b2ee7939a8352241df54f',
    messagingSenderId: '850573478366',
    projectId: 'chat-app-ad0fa',
    authDomain: 'chat-app-ad0fa.firebaseapp.com',
    storageBucket: 'chat-app-ad0fa.appspot.com',
    measurementId: 'G-LKVNK5JFZ0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXfzfXEgiqFWvdzeGY8YyHws1kSAL7HAc',
    appId: '1:850573478366:android:946db36aa63336c11df54f',
    messagingSenderId: '850573478366',
    projectId: 'chat-app-ad0fa',
    storageBucket: 'chat-app-ad0fa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB6zYEQsADqIGVwD6VbCvXM-Q2eNWQOdUA',
    appId: '1:850573478366:ios:c28950f47571a4a41df54f',
    messagingSenderId: '850573478366',
    projectId: 'chat-app-ad0fa',
    storageBucket: 'chat-app-ad0fa.appspot.com',
    iosClientId: '850573478366-im5fu3nodbn5u505ng2p36f0h7bfgv5j.apps.googleusercontent.com',
    iosBundleId: 'com.example.chattApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB6zYEQsADqIGVwD6VbCvXM-Q2eNWQOdUA',
    appId: '1:850573478366:ios:f449e38710c1c1a81df54f',
    messagingSenderId: '850573478366',
    projectId: 'chat-app-ad0fa',
    storageBucket: 'chat-app-ad0fa.appspot.com',
    iosClientId: '850573478366-b49d5gbjmq1jntn11sbkfma0fcj2hpuh.apps.googleusercontent.com',
    iosBundleId: 'com.example.chattApp.RunnerTests',
  );
}
