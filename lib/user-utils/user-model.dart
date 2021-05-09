import 'package:attend/index.dart';

class UserModel {
  String branch;
  String department;
  String firstName;
  String lastName;
  String role;
  int sem;
  int year;
  String profilePic;
  String section;
  String userName;

  UserModel(
      {this.branch,
      this.department,
      this.firstName,
      this.lastName,
      this.role,
      this.sem,
      this.year,
      this.profilePic,
      this.section,
      this.userName});

  factory UserModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> parsedJson) {
    return UserModel(
      branch: parsedJson.data()['branch'],
      department: parsedJson.data()['department'],
      firstName: parsedJson.data()['firstName'],
      lastName: parsedJson.data()['lastName'],
      role: parsedJson.data()['role'],
      sem: parsedJson.data()['sem'],
      year: parsedJson.data()['year'],
      profilePic: parsedJson.data()['profilePic'],
      section: parsedJson.data()['section'],
      userName: parsedJson.id.split('@').first
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['branch'] = branch;
    data['department'] = department;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['role'] = role;
    data['sem'] = sem;
    data['year'] = year;
    data['profilePic'] = profilePic;
    data['section'] = section;
  }
}
