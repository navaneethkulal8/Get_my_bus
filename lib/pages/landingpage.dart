import 'package:flutter/material.dart';
import 'busdetailspage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _destinationFocusNode = FocusNode();
  final FocusNode _pickupFocusNode = FocusNode();
  String? _selectedTime; // Hold the selected time, initially null

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _destinationFocusNode.dispose();
    _pickupFocusNode.dispose();
    super.dispose();
  }

  void navigateToBusDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BusDetailsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: TextField(
              focusNode: _nameFocusNode,
              onTap: () {
                _nameFocusNode.requestFocus();
              },
              decoration: InputDecoration(
                hintText: 'Starting location',
                contentPadding: const EdgeInsets.all(10),
                border: InputBorder.none,
                suffixIcon: const Icon(Icons.add),
              ),
            ),
          ),
          SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
            child: TextField(
              focusNode: _destinationFocusNode,
              onTap: () {
                _destinationFocusNode.requestFocus();
              },
              decoration: InputDecoration(
                hintText: 'End destination',
                contentPadding: const EdgeInsets.all(10),
                border: InputBorder.none,
                suffixIcon: const Icon(Icons.add),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Timings",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'From',
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'To',
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: DropdownButton<String>(
                    hint: const Text('All'),
                    value: _selectedTime,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedTime = newValue;
                      });
                    },
                    items: <String>[
                      'Express',
                      'Super fast service',
                      'Local',
                      'All'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Get My Bus"),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 10),
          Divider(thickness: 2),
          SizedBox(height: 10),
          GestureDetector(
            onTap: navigateToBusDetailsPage,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(Icons.bus_alert),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bus Name",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text("Bus Number"),
                          SizedBox(height: 4),
                          Text("Arrival Time: Dummy Time"),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: navigateToBusDetailsPage,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Know More",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
