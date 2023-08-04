import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getmybus/pages/loginpage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // CircleAvatar(
              //   radius: 50,
              // //   backgroundImage: AssetImage(
              // //       'assets/images/photo.jpg'), // Replace with your own image
              // // ),
              const SizedBox(height: 16),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Shiva@example.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Name'),
                      subtitle: Text('John Doe'),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text('Address'),
                      subtitle: Text('123 Main Street'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('Contact Number'),
                      subtitle: Text('+1 123-456-7890'),
                    ),
                    ListTile(
                      leading: Icon(Icons.share),
                      title: Text('Share Location'),
                      onTap: () {
                        // Implement share location functionality
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.contact_mail),
                      title: Text('Contact Us'),
                      onTap: () {
                        // Implement contact us functionality
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _onLogoutPressed(context),
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Implement logout functionality
  Future<void> _onLogoutPressed(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Redirect to the login page after logout
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    } catch (e) {
      print('Logout failed: $e');
      // Show error message to the user if logout fails
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Logout Failed'),
            content:
                Text('An error occurred while logging out. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
