import 'package:firebase_core/firebase_core.dart';

FirebaseOptions get currentPlatformOptions {
  return FirebaseOptions(
    apiKey: 'YOUR_API_KEY',
    appId: 'YOUR_APP_ID',
    messagingSenderId: 'YOUR_SENDER_ID',
    projectId: 'YOUR_PROJECT_ID',
    // Add other necessary options
  );
}
