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

  UserModel(
      {this.branch,
      this.department,
      this.firstName,
      this.lastName,
      this.role,
      this.sem,
      this.year,
      this.profilePic});

  factory UserModel.fromJson(var parsedJson) {
    return UserModel(
      branch: parsedJson['branch'],
      department: parsedJson['department'],
      firstName: parsedJson['firstName'],
      lastName: parsedJson['lastName'],
      role: parsedJson['role'],
      sem: parsedJson['sem'],
      year: parsedJson['year'],
      profilePic: parsedJson['profilePic'],
    );
  }
}
