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
    apiKey: 'AIzaSyAiB34o-gAqprDe6PWneepr1bLwarGAkbc',
    appId: '1:102268746711:web:28e461b1bbf3cf0621e992',
    messagingSenderId: '102268746711',
    projectId: 'storeapp-f5421',
    authDomain: 'storeapp-f5421.firebaseapp.com',
    storageBucket: 'storeapp-f5421.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFxvy4mnAHuHVRr3-H4sI09bzdj_4Ax0A',
    appId: '1:102268746711:android:8341e04ddf55268a21e992',
    messagingSenderId: '102268746711',
    projectId: 'storeapp-f5421',
    storageBucket: 'storeapp-f5421.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzCVn5lSqOO5rVNsE5b-3_XDvRIonzais',
    appId: '1:102268746711:ios:033775ecde2231ca21e992',
    messagingSenderId: '102268746711',
    projectId: 'storeapp-f5421',
    storageBucket: 'storeapp-f5421.appspot.com',
    iosClientId: '102268746711-mgrik6419bfbat94rm5ct3d3natglod4.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzCVn5lSqOO5rVNsE5b-3_XDvRIonzais',
    appId: '1:102268746711:ios:780860535a6dac3721e992',
    messagingSenderId: '102268746711',
    projectId: 'storeapp-f5421',
    storageBucket: 'storeapp-f5421.appspot.com',
    iosClientId: '102268746711-nlev8eckaqdcf8meknm6625fjk80vr84.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled.RunnerTests',
  );
}
