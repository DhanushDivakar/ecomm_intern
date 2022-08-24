import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("WElcome back"),
                SizedBox(
                  height: 10,
                ),
                Text("Nmae"),
                Text("Nmae"),
                ActionChip(label: Text("logout"), onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
