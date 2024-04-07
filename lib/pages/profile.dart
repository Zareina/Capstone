
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: const Text('Profile', textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
     backgroundColor: Colors.purple[200],
     elevation: 10,
     ),
    );
  }
}