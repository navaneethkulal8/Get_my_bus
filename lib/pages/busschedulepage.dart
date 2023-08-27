import 'package:flutter/material.dart';

class BusSchedulePage extends StatefulWidget {
  @override
  _BusSchedulePageState createState() => _BusSchedulePageState();
}

class _BusSchedulePageState extends State<BusSchedulePage> {
  List<bool> bookmarks = List.generate(
      5, (index) => false); // Replace 5 with the actual number of bus schedules

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Your Bus Bookmarks',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: bookmarks.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.grey[100],
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16.0),
                        title: Text(
                          'Bus Schedule ${index + 1}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Destination:',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('Timings'),
                          ],
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                
                                    setState(() {
                                      bookmarks.removeAt(index);
                                    });
                                  },
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // TODO: Handle viewing the route
                                    // You can navigate to a new page or show a bottom sheet
                                  },
                                  child: Text('View Route'),
                                ),
                              ],
                            ),
                          ],
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
      ),
    );
  }
}
