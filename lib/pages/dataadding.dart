import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataAdding extends StatefulWidget {
  const DataAdding({Key? key}) : super(key: key);

  @override
  State<DataAdding> createState() => _DataAddingState();
}

class _DataAddingState extends State<DataAdding> {
  final TextEditingController _busNameController = TextEditingController();
  final TextEditingController _busNumberController = TextEditingController();
  final TextEditingController _arrivalTimeController = TextEditingController();
  final TextEditingController _routeController = TextEditingController();

  void _addDataToFirestore() {
    String busName = _busNameController.text;
    String busNumber = _busNumberController.text;
    String arrivalTime = _arrivalTimeController.text;
    String route = _routeController.text;

    // Create a new document in the "buses" collection with the user input data
    FirebaseFirestore.instance.collection('buses').add({
      'busName': busName,
      'busNumber': busNumber,
      'arrivalTime': arrivalTime,
      'route': route,
    }).then((_) {
      // Data added successfully, show a success message or navigate back
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Data added successfully'),
        duration: Duration(seconds: 2),
      ));

      // Clear the text fields after data is added
      _busNameController.clear();
      _busNumberController.clear();
      _arrivalTimeController.clear();
      _routeController.clear();
    }).catchError((error) {
      // Handle errors if data addition fails
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error adding data: $error'),
        duration: Duration(seconds: 2),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Adding'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _busNameController,
                decoration: InputDecoration(
                  labelText: 'Bus Name',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _busNumberController,
                decoration: InputDecoration(
                  labelText: 'Bus Number',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _arrivalTimeController,
                decoration: InputDecoration(
                  labelText: 'Arrival Time',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _routeController,
                decoration: InputDecoration(
                  labelText: 'Route',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addDataToFirestore,
                child: Text('Add Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
