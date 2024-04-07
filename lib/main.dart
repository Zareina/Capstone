import 'package:zjf_capstone/firestore.dart';
import 'package:zjf_capstone/homepage.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' hide ProfileScreen;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
       FirestoreService().addUserData(user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
          body: FirebaseAuth.instance.currentUser == null
              ? SignInScreen(
                  headerBuilder: (context, constraints, shrinkOffset) {
                    return Image.asset(
                      'assets/output.png',
                      width: 200,
                      height: 200,
                    );
                  },
                  providers: [
                    EmailAuthProvider(),
                  ],
                  actions: [
                    AuthStateChangeAction<SignedIn>((context, state) {
                      setState(() {});
                    }),
                    AuthStateChangeAction<UserCreated>((context, state) {
                      setState(() {});
                    }),
                  ],
                )
              : HomePage()),
    );
  }
}
