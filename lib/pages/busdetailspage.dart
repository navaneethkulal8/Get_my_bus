import 'package:flutter/material.dart';

class BusDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Details"),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Bus Ratings",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // Add rating and comment widgets here
          SizedBox(height: 20),
          Text(
            "Driver Information",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // Add driver details widgets here
          SizedBox(height: 20),
          Text(
            "Fare Information",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // Add fare details widgets here
        ],
      ),
    );
  }
}
