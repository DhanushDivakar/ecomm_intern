
class UserMode{
  String? uid;
  String? email;
  String? firstName;
  String? cityName;
  String? zipCode;
  String? phoneField;
  String? ageField;
  String? genderField;

  UserMode({ this.uid, this.email, this.firstName, this.cityName, this.zipCode,
      this.phoneField, this.ageField, this.genderField});


  //taking data from server
factory UserMode.fromMap(map){
  return UserMode(
    uid: map['uid'],
    email: map['email'],
    firstName: map['firstName'],
    cityName: map['cityName'],
    zipCode: map['zipCode'],
    phoneField: map['phoneField'],
    ageField: map['ageField'],
    genderField: map['genderField'],

  );
}
//sending data to server
Map<String, dynamic> toMap(){
  return {
    'uid': uid,
    'email': email,
    'firstname': firstName,
    'cityName': cityName,
    'zipCode': zipCode,
    'phoneField': phoneField,
    'ageField': ageField,
    'genderField' : genderField,

  };
}


}