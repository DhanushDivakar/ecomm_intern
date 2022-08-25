import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_intern/model/usermodel.dart';
import 'package:project_intern/screens/login_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserMode loggedInUser = UserMode();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((value){this.loggedInUser = UserMode.fromMap(value.data());
      setState(() {

      });});
  }



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

                SizedBox(
                  height: 10,
                ),
                Text("${loggedInUser.firstName} ",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("${loggedInUser.email}",
                style: TextStyle(
                  fontSize: 20,
                ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("${loggedInUser.cityName}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("${loggedInUser.zipCode}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("${loggedInUser.phoneField}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("${loggedInUser.ageField}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Colors.black,
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      logout(context);
                    },
                    child: Text(
                      "Logout",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    )),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async
  {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
