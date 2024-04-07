import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  Future<void> addUserData(User user) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    await users.doc(user.uid).set({
      'uid': user.uid,
      'email': user.email,
    });
  }

  Future<void> addClass(Map<String, dynamic> classData, String uid) async {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');
    // Generate a unique document ID for the class
    var classDoc = users.doc(uid).collection('classes').doc();
    return await classDoc
        .set(classData); 
  }
}
