import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key, required this.title});

  final Text title;

  @override
  State<StatefulWidget> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: widget.title,
        ),
        body: Column(children: [
          Expanded(
              child: Center(
            child: IndexedStack(
              index: _selectedIndex,
              children: [Text('Home'), Text('Profile'), Text('Settings')],
            ),
          ))
        ]),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings')
          ],
        ));
  }
}
