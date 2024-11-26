import 'package:calender/pages/CalenderPage.dart';
import 'package:calender/pages/FavoritesPage.dart';
import 'package:calender/pages/GeneratorPage.dart';
import 'package:calender/pages/ToDosPage.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Organizer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
        ),
        home: const MainPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int navbarIndex = 0;

  final List<Widget> pages = [
    GeneratorPage(),
    FavoritesPage(),
    CalenderPage(),
  ];

  final List<NavigationDestination> destinations = [
    NavigationDestination(icon: Icon(Icons.add_task), label: "TODOs"),
    NavigationDestination(icon: Icon(Icons.calendar_month), label: "Calendar"),
    NavigationDestination(icon: Icon(Icons.history), label: "History"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[navbarIndex],
      bottomNavigationBar: SafeArea(
        child: NavigationBar(
          destinations: destinations,
          selectedIndex: navbarIndex,
          onDestinationSelected: (int index) {
            setState(() {
              navbarIndex = index;
            });
          },
        ),
      ),
    );
  }
}
