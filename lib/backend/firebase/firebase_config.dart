import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCPkJmoCP71_v1CtS7CSYIMk18QdxgdksM",
            authDomain: "rivinsight-b418d.firebaseapp.com",
            projectId: "rivinsight-b418d",
            storageBucket: "rivinsight-b418d.appspot.com",
            messagingSenderId: "19202180327",
            appId: "1:19202180327:web:2a0ed7ad82a0b370e88e42"));
  } else {
    await Firebase.initializeApp();
  }
}
