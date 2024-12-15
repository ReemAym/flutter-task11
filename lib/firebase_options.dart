// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyB7pXJarkeyN8VhnCOr5fhk1NqzFzgpD4o',
    appId: '1:895308532347:web:ad13c5306e257daef2b0de',
    messagingSenderId: '895308532347',
    projectId: 'fruit-hub-1a6cb',
    authDomain: 'fruit-hub-1a6cb.firebaseapp.com',
    storageBucket: 'fruit-hub-1a6cb.firebasestorage.app',
    measurementId: 'G-4HBZPCW6R4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfIODb6gSRK4pgBMeuEhP25ePOGsVGVUQ',
    appId: '1:895308532347:android:559626544c572c17f2b0de',
    messagingSenderId: '895308532347',
    projectId: 'fruit-hub-1a6cb',
    storageBucket: 'fruit-hub-1a6cb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhh5A9JzugTDvkScoQ1kRo708HaFWi5qc',
    appId: '1:895308532347:ios:94754533ae2087c1f2b0de',
    messagingSenderId: '895308532347',
    projectId: 'fruit-hub-1a6cb',
    storageBucket: 'fruit-hub-1a6cb.firebasestorage.app',
    androidClientId: '895308532347-o27f190j0isi6q0olrugb5r93o6lnd3u.apps.googleusercontent.com',
    iosClientId: '895308532347-pvn75fpf3lk9ojeki8nro0d5uv9r1gri.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhh5A9JzugTDvkScoQ1kRo708HaFWi5qc',
    appId: '1:895308532347:ios:94754533ae2087c1f2b0de',
    messagingSenderId: '895308532347',
    projectId: 'fruit-hub-1a6cb',
    storageBucket: 'fruit-hub-1a6cb.firebasestorage.app',
    androidClientId: '895308532347-o27f190j0isi6q0olrugb5r93o6lnd3u.apps.googleusercontent.com',
    iosClientId: '895308532347-pvn75fpf3lk9ojeki8nro0d5uv9r1gri.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB7pXJarkeyN8VhnCOr5fhk1NqzFzgpD4o',
    appId: '1:895308532347:web:b491360b0f31a679f2b0de',
    messagingSenderId: '895308532347',
    projectId: 'fruit-hub-1a6cb',
    authDomain: 'fruit-hub-1a6cb.firebaseapp.com',
    storageBucket: 'fruit-hub-1a6cb.firebasestorage.app',
    measurementId: 'G-JWKGHZ8TEL',
  );

}