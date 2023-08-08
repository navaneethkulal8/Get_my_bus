import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataAdding extends StatefulWidget {
  const DataAdding({Key? key}) : super(key: key);

  @override
  State<DataAdding> createState() => _DataAddingState();
}

class _DataAddingState extends State<DataAdding> {
  final TextEditingController _startingLocationController =
      TextEditingController();
  final TextEditingController _endDestinationController =
      TextEditingController();
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _busNameController = TextEditingController();
  final TextEditingController _busNumberController = TextEditingController();
  final TextEditingController _arrivalTimeController = TextEditingController();
  final TextEditingController _routeController = TextEditingController();
  String? _selectedTime; // Holds the selected dropdown value, initially 'All'

  void _addDataToFirestore() {
    String startingLocation = _startingLocationController.text;
    String endDestination = _endDestinationController.text;
    String from = _fromController.text;
    String to = _toController.text;
    String busName = _busNameController.text;
    String busNumber = _busNumberController.text;
    String arrivalTime = _arrivalTimeController.text;
    String route = _routeController.text;

    FirebaseFirestore.instance.collection('buses').add({
      'startingLocation': startingLocation,
      'endDestination': endDestination,
      'from': from,
      'to': to,
      'busName': busName,
      'busNumber': busNumber,
      'arrivalTime': arrivalTime,
      'route': route,
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Data added successfully'),
        duration: Duration(seconds: 2),
      ));

      _startingLocationController.clear();
      _endDestinationController.clear();
      _fromController.clear();
      _toController.clear();
      _busNameController.clear();
      _busNumberController.clear();
      _arrivalTimeController.clear();
      _routeController.clear();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error adding data: $error'),
        duration: Duration(seconds: 2),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Text(
              'Add Data',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: _startingLocationController,
              decoration: InputDecoration(
                labelText: 'Starting Location',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _endDestinationController,
              decoration: InputDecoration(
                labelText: 'End Destination',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _fromController,
              decoration: InputDecoration(
                labelText: 'From',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _toController,
              decoration: InputDecoration(
                labelText: 'To',
              ),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              hint: Text('Express'),
              value: _selectedTime,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTime = newValue;
                });
              },
              items: <String>['Express', 'Super fast service', 'Local']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Divider(thickness: 1),
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
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
