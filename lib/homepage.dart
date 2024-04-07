import 'package:flutter/material.dart';
import 'package:zjf_capstone/pages/class.dart';
import 'package:zjf_capstone/pages/profile.dart';
import 'package:zjf_capstone/pages/report.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   List<Widget> pages = [Class(),Report(), Profile()];
  var selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage] , 
      bottomNavigationBar:  BottomNavigationBar(
        currentIndex: selectedPage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Classes'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Report'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
        ],
        onTap: (value) {
          setState(() {
            selectedPage = value;
          });
          
        },
      ),
    );
  }
}
