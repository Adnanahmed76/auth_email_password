import 'package:authe_email/functions/authfunctions.dart';
import 'package:authe_email/screens/Signup.dart';
import 'package:authe_email/screens/cloud_firebase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
       builder: (context,snapshot){
        if(snapshot.hasData){
          return HomePage();
        }
        else{
          return DatabaseOptions();
        }
       })
      );
  }
}
