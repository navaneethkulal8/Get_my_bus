import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getmybus/pages/homepage.dart';
import 'package:getmybus/pages/loginpage.dart';
// Import the firebase_app_check plugin
import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Activate FirebaseAppCheck
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
    // Default provider for Android is SafetyNet
    androidProvider: AndroidProvider.safetyNet,
    // Default provider for iOS/macOS is Device Check
    appleProvider: AppleProvider.deviceCheck,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a simple loading screen with a CircularProgressIndicator
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          // Check if the user is logged in or not
          final isUserLoggedIn = snapshot.hasData;

          // Return the appropriate screen based on the user's authentication status
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: isUserLoggedIn ? Homepage() : LoginPage(),
          );
        }
      },
    );
  }
}
