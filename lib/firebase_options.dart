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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC5Wgj-rg8QvLeKU4_0Zlhn56k5et2slXk',
    appId: '1:1064975885884:web:51f8ce7900a23d18254539',
    messagingSenderId: '1064975885884',
    projectId: 'cmpapp-347801',
    authDomain: 'cmpapp-347801.firebaseapp.com',
    databaseURL: 'https://cmpapp-347801-default-rtdb.firebaseio.com',
    storageBucket: 'cmpapp-347801.appspot.com',
    measurementId: 'G-C2KMPF6RFB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDR9GFeXA3dbAQlOGeTwISuHlD6DqeUcb4',
    appId: '1:1064975885884:android:6921b6d1e7ac5b7a254539',
    messagingSenderId: '1064975885884',
    projectId: 'cmpapp-347801',
    databaseURL: 'https://cmpapp-347801-default-rtdb.firebaseio.com',
    storageBucket: 'cmpapp-347801.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBRWfAhrqI2MZOD3Z4VKZNoxgyij0CPyLk',
    appId: '1:1064975885884:ios:85fd0107236d0ab0254539',
    messagingSenderId: '1064975885884',
    projectId: 'cmpapp-347801',
    databaseURL: 'https://cmpapp-347801-default-rtdb.firebaseio.com',
    storageBucket: 'cmpapp-347801.appspot.com',
    iosClientId: '1064975885884-m1c8h99amij865qtd76gso831foac1fq.apps.googleusercontent.com',
    iosBundleId: 'com.cmp.app',
  );
}
