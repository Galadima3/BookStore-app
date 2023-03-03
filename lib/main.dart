
import 'package:bookstore_app/src/features/saved_books/presentation/saved_books.dart';
import 'package:bookstore_app/src/features/search/presentation/search_page.dart';
import 'package:bookstore_app/src/shared/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List screens = [
    HomePage(),
    const SavedBooksPage(),
    SearchPage(),
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 22,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark,
                ),
                label: 'Saved',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.green.shade500,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            elevation: 5,
          ),
          //body: HomePage(),
          body: screens.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
