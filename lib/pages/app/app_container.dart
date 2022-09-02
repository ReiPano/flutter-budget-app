import 'package:budget/pages/home/home.dart';
import 'package:budget/pages/receipt/receipt.dart';
import 'package:budget/pages/report/report.dart';
import 'package:flutter/material.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  int _selectedIndex = 0;
  static final List<Widget> _pages = <Widget>[
    HomePage(),
    const Receip(),
    const Report(),
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
        title: Text(widget.title),
      ),
      body: Container(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigoAccent[800],
        enableFeedback: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
