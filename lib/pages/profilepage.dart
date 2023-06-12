import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/avatar.png'), // Replace with your own image
              ),
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
                'johndoe@example.com',
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
                onPressed: () {
                  // Implement edit profile functionality
                },
                child: const Text('Edit Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
