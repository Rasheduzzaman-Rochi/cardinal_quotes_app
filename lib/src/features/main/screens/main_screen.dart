import 'package:flutter/material.dart';
import '../../home/screens/home_screen.dart';
import '../widgets/custom_nav_bar.dart';

// Placeholder widgets for the other screens
class SoundsScreen extends StatelessWidget {
  const SoundsScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Sounds Screen')));
}

class SoulScreen extends StatelessWidget {
  const SoulScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Soul Screen')));
}

class TopScreen extends StatelessWidget {
  const TopScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('Top Screen')));
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});
  @override
  Widget build(BuildContext context) =>
      const Scaffold(body: Center(child: Text('More Screen')));
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // A variable to keep track of the currently selected tab index
  int _selectedIndex = 0;

  // A list of pages corresponding to each tab in the navigation bar
  static const List<Widget> _pages = <Widget>[
    HomeScreen(), // Your actual home screen
    SoundsScreen(),
    SoulScreen(),
    TopScreen(),
    MoreScreen(),
  ];

  // This function will be called when a navigation bar item is tapped
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body will display the page corresponding to the selected index
      body: _pages.elementAt(_selectedIndex),
      // Our custom-built navigation bar
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}