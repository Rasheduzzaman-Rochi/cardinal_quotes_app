import 'package:cardinal_quotes_app/src/features/home/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import '../../home/screens/home_screen.dart';
import '../widgets/custom_nav_bar.dart';

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
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    SoundsScreen(),
    SoulScreen(),
    TopScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: _pages.elementAt(_selectedIndex),
      drawer: const HomeDrawer(),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
