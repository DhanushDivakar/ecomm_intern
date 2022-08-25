

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_intern/model/usermodel.dart';
import 'package:project_intern/screens/home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUptState();
}

class _SignUptState extends State<SignUp> {
  List<String> items = [ 'Choose','Seller', 'Customer'];
  String? selectedItem = 'Choose';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(60.0),
          child: DropdownButtonFormField<String>(
            menuMaxHeight: 500.0,
            dropdownColor: Colors.white,
            decoration: InputDecoration(
              label: const Text("Choose"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(width: 2, color: Colors.black),
              ),
            ),
            value: selectedItem,

            items: items
                .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(fontSize: 20),
                    )))
                .toList(),
            onChanged: (item) => setState(
              () => selectedItem = item,
            ),
            // onTap: () {
            //  if(items[1] == false){
            //    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignUpScreen()));
            //  }
            //  else{
            //    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Buyer()));
            //  }
            // },

          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
  final _auth = FirebaseAuth.instance;
  //form key
  final _formKey = GlobalKey<FormState>();

  //editing controller
  final firstNameEditingController = TextEditingController();
  final cityNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final zipCodeEditingController = TextEditingController();
  final genderEditingController = TextEditingController();
  final phoneEditingController = TextEditingController();
  final ageEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter valid name min 3 char");
        }
        return null;
      },
      onSaved: (value) {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 3, color: Colors.black),
        ),
      ),
    );
    final cityNameField = TextFormField(
      autofocus: false,
      controller: cityNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First name cannot be empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter valid name min 3 char");
        }
      },
      onSaved: (value) {
        cityNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "City Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 3, color: Colors.black),
        ),
      ),
    );
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 3, color: Colors.black),
        ),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 3, color: Colors.black),
        ),
      ),
    );
    final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value){
        if(confirmPasswordEditingController.text != passwordEditingController.text ){
          return "Password Doesn't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 3, color: Colors.black),
        ),
      ),
    );
    final zipCodeField = TextFormField(
      autofocus: false,
      controller: zipCodeEditingController,
      keyboardType: TextInputType.number,

      //validator; ()
      onSaved: (value) {
        zipCodeEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "ZipCode",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 3, color: Colors.black),
        ),
      ),
    );
    final phoneField = TextFormField(
      autofocus: false,
      controller: phoneEditingController,
      keyboardType: TextInputType.phone,

      //validator; ()
      onSaved: (value) {
        phoneEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Phone Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 3, color: Colors.black),
        ),
      ),
    );
    final ageField = TextFormField(
      autofocus: false,
      controller: ageEditingController,
      keyboardType: TextInputType.number,

      //validator; ()
      onSaved: (value) {
        ageEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Age",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 3, color: Colors.black),
        ),
      ),
    );
    final genderField = TextFormField(
      autofocus: false,
      controller: genderEditingController,
      keyboardType: TextInputType.name,

      //validator; ()
      onSaved: (value) {
        genderEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Gender",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 3, color: Colors.black),
        ),
      ),
    );
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.black,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);

        },
        child: const Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(
              height: 200,
              child: SignUp(),

            ),
            Container(

              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      firstNameField,
                      const SizedBox(
                        height: 20,
                      ),
                      cityNameField,
                      const SizedBox(
                        height: 20,
                      ),
                      zipCodeField,
                      const SizedBox(
                        height: 30,
                      ),
                      phoneField,
                      const SizedBox(
                        height: 30,
                      ),
                      ageField,
                      const SizedBox(
                        height: 30,
                      ),
                      genderField,
                      const SizedBox(
                        height: 30,
                      ),
                      emailField,
                      const SizedBox(
                        height: 20,
                      ),
                      passwordField,
                      const SizedBox(
                        height: 20,
                      ),
                      confirmPasswordField,
                      const SizedBox(
                        height: 30,
                      ),
                      signUpButton,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );

  }
  void signUp(String email, String password) async{
    if(_formKey.currentState!.validate()){
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => {
        postDetailsToFirestore()
      }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);
      });

    }
  }

  postDetailsToFirestore() async{
    //calling our firestore
    //calling our user model
    //sending thses values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    
    UserMode userMode = UserMode();
    
    //writign all the values
    userMode.email = user!.email;
    userMode.uid = user.uid;
    userMode.firstName = firstNameEditingController.text;
    userMode.cityName = cityNameEditingController.text;
    userMode.genderField = genderEditingController.text;
    userMode.ageField = ageEditingController.text;
    userMode.phoneField = phoneEditingController.text;
    userMode.zipCode = zipCodeEditingController.text;
    
    await firebaseFirestore.collection("users").doc(user.uid).set(userMode.toMap());
    Fluttertoast.showToast(msg: "Account created");

    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => Homescreen()), (route) => false);
    
    
  }

}
