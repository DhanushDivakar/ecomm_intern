import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_intern/screens/login_screen.dart';

 Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
