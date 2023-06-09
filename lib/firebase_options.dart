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
    apiKey: 'AIzaSyBFD6pkyI5an37Bjq_QcCLx5aoEYofj4RU',
    appId: '1:795034514417:web:6f8791f5e44c1621204a50',
    messagingSenderId: '795034514417',
    projectId: 'merkez-led',
    authDomain: 'merkez-led.firebaseapp.com',
    databaseURL: 'https://merkez-led-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'merkez-led.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCYaagnKLRGsISx3rZDiediNuW-01Ysrrw',
    appId: '1:795034514417:android:4dda979eed72adee204a50',
    messagingSenderId: '795034514417',
    projectId: 'merkez-led',
    databaseURL: 'https://merkez-led-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'merkez-led.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjlt-d--gCqCaUPCrsohDGZidX3q9JjIs',
    appId: '1:795034514417:ios:e7ec8cb9f2af3d27204a50',
    messagingSenderId: '795034514417',
    projectId: 'merkez-led',
    databaseURL: 'https://merkez-led-default-rtdb.europe-west1.firebasedatabase.app',
    storageBucket: 'merkez-led.appspot.com',
    androidClientId: '795034514417-1d966q4pekoskjp6e5rdv2o7ju46hq2f.apps.googleusercontent.com',
    iosClientId: '795034514417-d6pi6ccevddnilg26hv7qaf32s4eq77k.apps.googleusercontent.com',
    iosBundleId: 'com.example.merkezledapp',
  );
}
