import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _destinationFocusNode = FocusNode();
  final FocusNode _pickupFocusNode = FocusNode();

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _destinationFocusNode.dispose();
    _pickupFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              focusNode: _nameFocusNode,
              onTap: () {
                _nameFocusNode.requestFocus();
              },
              decoration: InputDecoration(
                hintText: 'Starting location',
                border: OutlineInputBorder(),
                labelText: 'Starting location',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                suffixIcon: Icon(Icons.add),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              focusNode: _destinationFocusNode,
              onTap: () {
                _destinationFocusNode.requestFocus();
              },
              decoration: InputDecoration(
                hintText: 'End destination',
                border: OutlineInputBorder(),
                labelText: ' End Destination',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                suffixIcon: Icon(Icons.add),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              focusNode: _pickupFocusNode,
              onTap: () {
                _pickupFocusNode.requestFocus();
              },
              decoration: InputDecoration(
                hintText: 'Timings',
                border: OutlineInputBorder(),
                labelText: 'Timings',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
