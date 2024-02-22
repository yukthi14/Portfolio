import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      // case TargetPlatform.android:
      //   return android;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
      apiKey: "AIzaSyDAry4sKYtdhIa5pGLMudy5CKjBtV6s8ww",
      authDomain: "portfolio-ac1de.firebaseapp.com",
      projectId: "portfolio-ac1de",
      storageBucket: "portfolio-ac1de.appspot.com",
      messagingSenderId: "763146995676",
      appId: "1:763146995676:web:a0d632cc9796eef8adb119",
      measurementId: "G-LNVF9KQHRT"

      // databaseURL: "https://dynamicportfolio-c8f33.firebasedatabase.app",
      );

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyDAry4sKYtdhIa5pGLMudy5CKjBtV6s8ww",
      authDomain: "portfolio-ac1de.firebaseapp.com",
      projectId: "portfolio-ac1de",
      storageBucket: "portfolio-ac1de.appspot.com",
      messagingSenderId: "763146995676",
      appId: "1:763146995676:web:a0d632cc9796eef8adb119",
      measurementId: "G-LNVF9KQHRT");
}
