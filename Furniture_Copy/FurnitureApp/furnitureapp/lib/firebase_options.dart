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
    apiKey: 'AIzaSyAnGvGCkW8O7ZMRrXe86yQKSi9Zcmbe2Vo',
    appId: '1:891613711676:web:b98c0313acd436b6ef6239',
    messagingSenderId: '891613711676',
    projectId: 'furniturecopy',
    authDomain: 'furniturecopy.firebaseapp.com',
    storageBucket: 'furniturecopy.appspot.com',
    measurementId: 'G-7MVCT93MCP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWjZvDfZhziFs8Z2DExfURPrp657Lu_vc',
    appId: '1:891613711676:android:669f8a4d427444ffef6239',
    messagingSenderId: '891613711676',
    projectId: 'furniturecopy',
    storageBucket: 'furniturecopy.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1gd_Har4-IEId10D8zLb4NKYwx5DT66c',
    appId: '1:891613711676:ios:f9630a9d4db82ba9ef6239',
    messagingSenderId: '891613711676',
    projectId: 'furniturecopy',
    storageBucket: 'furniturecopy.appspot.com',
    iosBundleId: 'com.example.furnitureapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC1gd_Har4-IEId10D8zLb4NKYwx5DT66c',
    appId: '1:891613711676:ios:d955d8d4faefddb1ef6239',
    messagingSenderId: '891613711676',
    projectId: 'furniturecopy',
    storageBucket: 'furniturecopy.appspot.com',
    iosBundleId: 'com.example.furnitureapp.RunnerTests',
  );
}
