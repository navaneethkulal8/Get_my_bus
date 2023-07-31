import 'package:flutter/material.dart';
import 'package:getmybus/pages/landingpage.dart';
import 'package:getmybus/pages/create_account.dart';
import 'package:firebase_core/firebase_core.dart';
import 'pages/mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
          AuthenticationWrapper(), // Use the AuthenticationWrapper widget to handle login status.
    );
  }
}

class AuthenticationWrapper extends StatefulWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  bool _isLoggedIn = false;

  void _onLogin() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoggedIn) {
      return MainPage(); // Show MainPage if the user is logged in.
    } else {
      return CreateAccountPage(); // Show CreateAccountPage otherwise.
    }
  }
}
