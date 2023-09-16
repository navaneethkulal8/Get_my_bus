import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:getmybus/pages/loginpage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Shiva@example.com',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 24),
            _buildListTile(Icons.person, 'Name', 'John Doe'),
            _buildListTile(
              Icons.location_on,
              'Address',
              '123 Main Street',
            ),
            _buildListTile(
              Icons.phone,
              'Contact Number',
              '+1 123-456-7890',
            ),
            _buildListTile(
              Icons.share,
              'Share Location',
              _handleShareLocation,
            ),
            _buildListTile(
              Icons.contact_mail,
              'Contact Us',
              _handleContactUs,
            ),
            SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => _onLogoutPressed(context),
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, dynamic content) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: content is String ? Text(content) : null,
      onTap: content is Function ? () => content() : null,
    );
  }

  void _handleShareLocation() {
    // Implement share location functionality
  }

  void _handleContactUs() {
    // Implement contact us functionality
  }

  Future<void> _onLogoutPressed(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      print('Logout failed: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Logout Failed'),
            content:
                Text('An error occurred while logging out. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
