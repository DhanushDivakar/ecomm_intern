

import 'package:flutter/material.dart';
import 'package:project_intern/screens/bottom_nav_bar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomNavigationBar: BottomBar(),
    );
  }
}
