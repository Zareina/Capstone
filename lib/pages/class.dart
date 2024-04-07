import 'package:flutter/material.dart';
import 'package:zjf_capstone/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Class extends StatefulWidget {
  const Class({super.key});

  @override
  State<Class> createState() => _ClassState();
}

class _ClassState extends State<Class> {
  TextEditingController classNameController = TextEditingController();
  var selectedGrade = '1';
  var selectedSection = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Classes',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple[200],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text('Add a Class'),
                    content: Container(
                      width:200,
                      height:200,
                      child: Column(
                        children: [
                          DropdownMenu(
                              label: Text('Grade Level'),
                              width: 200,
                              initialSelection: '1',
                              onSelected: (s) {
                                selectedGrade = s!;
                              },
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(value: '4', label: '4'),
                                DropdownMenuEntry(value: '5', label: '5'),
                                DropdownMenuEntry(value: '6', label: '6'),
                              ]),
                          const SizedBox(
                            height: 40,
                          ),
                          DropdownMenu(
                              label: Text('Section'),
                              width: 200,
                              initialSelection: '1',
                              onSelected: (s) {
                                selectedSection = s!;
                              },
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(value: 'A', label: 'A'),
                                DropdownMenuEntry(value: 'A', label: 'B'),
                              ]),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            FirestoreService().addClass({
                              "grade": selectedGrade,
                              "section": selectedSection
                            }, FirebaseAuth.instance.currentUser!.uid);
                            Navigator.of(context).pop(); 
                          },
                          child: const Text('Add Class'))
                    ],
                  ));
        },
        child: Icon(Icons.add_circle),
        tooltip: 'Add a new Class',
      ),
    );
  }
}
