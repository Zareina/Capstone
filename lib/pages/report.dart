import 'package:flutter/material.dart';

class Report
 extends StatefulWidget {
  const Report
  ({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report
> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Report', textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),),
     backgroundColor: Colors.purple[200],
     ),
    );
  }
}