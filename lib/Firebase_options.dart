import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDPKi7RHsv3jzTUZz_yooD08AOZIBrBu04',
    appId: '1:462880464068:web:00ac189afe3147174283b4',
    messagingSenderId: '462880464068',
    projectId: 'e-schoolsolutionconnect',
    authDomain: 'e-schoolsolutionconnect.firebaseapp.com',
    storageBucket: 'e-schoolsolutionconnect.appspot.com',
    measurementId: 'G-HVNGJMZVXR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPKi7RHsv3jzTUZz_yooD08AOZIBrBu04',
    appId: '1:462880464068:android:4529d2a23c38bfac61fd91',
    messagingSenderId: '462880464068',
    projectId: 'e-schoolsolutionconnect',
    storageBucket: 'e-schoolsolutionconnect.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDl3Xr3J_z7GkeerSZkGLIORVlPKPJpTw8',
    appId: '1:462880464068:ios:ce24e5c1aab7ea76e93cec',
    messagingSenderId: '462880464068',
    projectId: 'e-schoolsolutionconnect',
    storageBucket: 'e-schoolsolutionconnect.appspot.com',
    iosClientId:
        '462880464068-5h89e9qotinq46dnc4eqesl3a3sps8kr.apps.googleusercontent.com',
    iosBundleId: 'com.gjinfotech.essconnect',
  );
}
