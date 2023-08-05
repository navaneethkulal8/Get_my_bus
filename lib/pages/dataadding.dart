import 'package:flutter/material.dart';

class DataAdding extends StatefulWidget {
  const DataAdding({Key? key}) : super(key: key);

  @override
  State<DataAdding> createState() => _DataAddingState();
}

class _DataAddingState extends State<DataAdding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Adding'),
      ),
      body: Center(
        child: Container(
          child: Text('Your data goes here'),
        ),
      ),
    );
  }
}
