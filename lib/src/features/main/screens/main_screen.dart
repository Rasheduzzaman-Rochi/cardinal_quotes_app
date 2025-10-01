import 'package:cardinal_quotes_app/src/features/home/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import '../../home/screens/home_screen.dart';
import '../../soul_check_in/screens/soul_screen.dart';
import '../../sounds/screens/audio_list_screen.dart';
import '../widgets/custom_nav_bar.dart';

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
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      HomeScreen(onTabChange: _onItemTapped),
      AudioListScreen(onBackTapped: () => _onItemTapped(0)),
      SoulScreen(onBackTapped: () => _onItemTapped(0)),
      const TopScreen(),
      const MoreScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: IndexedStack(index: _selectedIndex, children: _pages),
      drawer: HomeDrawer(onItemTapped: _onItemTapped),
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}