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
              'Available Buses',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5, // Replace with your actual number of buses
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('Bus Name ${index + 1}'),
                    subtitle: Text(
                        'Timing: 9:00 AM'), // Replace with your actual bus timings
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
