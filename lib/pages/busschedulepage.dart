import 'package:flutter/material.dart';

class BusSchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'User Activity Log',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5, // Replace with your actual number of log entries
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('Activity ${index + 1}'),
                    subtitle: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', // Replace with your actual log entry details
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
