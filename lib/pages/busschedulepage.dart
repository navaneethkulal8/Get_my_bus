import 'package:flutter/material.dart';

class BusSchedulePage extends StatefulWidget {
  @override
  _BusSchedulePageState createState() => _BusSchedulePageState();
}

class _BusSchedulePageState extends State<BusSchedulePage> {
  List<bool> bookmarks = List.generate(
      5, (index) => false); // Replace 5 with actual number of bus schedules

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Bus Your Bookmarks',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    color: Colors.white,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10.0),
                      title: Text('Bus Schedule ${index + 1}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // TODO: Handle deleting the bookmark
                        },
                      ),
                      onTap: () {
                        setState(() {
                          bookmarks[index] = !bookmarks[index];
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
