import 'package:flutter/material.dart';
import 'package:work/screens/pages/home_page.dart';
import 'package:work/screens/pages/save_page.dart';
import 'package:work/screens/pages/search_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget>? _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(),
      const SearchPage(),
      const SavePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages![_currentIndex],
      bottomNavigationBar: bottomNavigartionBar(),
    );
  }

  BottomNavigationBar bottomNavigartionBar() => BottomNavigationBar(
        fixedColor: Colors.black,
        elevation: 0,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: ""),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      );
}
