import 'package:flutter/material.dart';
import 'package:getmybus/pages/busschedulepage.dart';
import 'package:getmybus/pages/dataadding.dart';
import 'package:getmybus/pages/landingpage.dart';
import 'package:getmybus/pages/profilepage.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    LandingPage(),
    BusSchedulePage(),
    ProfilePage(),
    DataAdding(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.bookmark_add_outlined,
    Icons.person,
    Icons.data_array_rounded,
  ];

  final List<Color> _iconColors = [
    Colors.blue, // Home icon color
    Colors.green, // Bus Schedule icon color
    Colors.red, // Profile icon color
    Colors.orange, // Data Adding icon color
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get My Bus'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: List.generate(_icons.length, (index) {
          return BottomNavigationBarItem(
            icon: Icon(
              _icons[index],
              color: _selectedIndex == index ? _iconColors[index] : Colors.grey,
            ),
            label: _getLabelText(index),
          );
        }),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  String _getLabelText(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Bus Schedule';
      case 2:
        return 'Profile';
      case 3:
        return 'Data Adding';
      default:
        return '';
    }
  }
}
