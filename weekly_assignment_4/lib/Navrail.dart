import 'package:flutter/material.dart';

class Navrail extends StatefulWidget {
  const Navrail({super.key, required this.title});

  final Text title;

  @override
  State<StatefulWidget> createState() => _NavrailState();
}

class _NavrailState extends State<Navrail> {
  int _selectedIndex = 0;
  double groupAlignment = -1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: widget.title),
        body: Row(
          children: <Widget>[
            NavigationRail(
              selectedIndex: _selectedIndex,
              groupAlignment: groupAlignment,
              labelType: NavigationRailLabelType.all,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedLabelTextStyle: TextStyle(color: Colors.blue),
              unselectedLabelTextStyle: TextStyle(color: Colors.black),
              selectedIconTheme: const IconThemeData(color: Colors.blue),
              useIndicator: false,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                    icon: Icon(Icons.favorite_border),
                    label: Text('Favorite'),
                    selectedIcon: Icon(Icons.favorite)),
                NavigationRailDestination(
                    icon: Icon(Icons.bookmark_outline),
                    label: Text('Bookmark'),
                    selectedIcon: Icon(Icons.bookmark)),
                NavigationRailDestination(
                    icon: Icon(Icons.star_border),
                    label: Text('Star'),
                    selectedIcon: Icon(Icons.star))
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
                child: Center(
                    child: IndexedStack(
              index: _selectedIndex,
              children: [Text('Favorite'), Text('Bookmark'), Text('Star')],
            )))
          ],
        ));
  }
}
