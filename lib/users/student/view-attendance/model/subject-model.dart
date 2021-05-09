import 'package:attend/index.dart';
class StudentSubjectModel {
  final String subjectCode;
  final String subject;
  final String teacherUserName;

  StudentSubjectModel({
    this.subjectCode,
    this.subject,
    this.teacherUserName,
  });
  factory StudentSubjectModel.fromJson(
      QueryDocumentSnapshot<Map<String, dynamic>> parsedJson) {
    return StudentSubjectModel(
      subjectCode: parsedJson.id,
      subject: parsedJson.data()['subject'],
      teacherUserName: parsedJson.data()['teacherUserName'],
    );
  }
}

class SubjectModel {
  final String subjectCode;
  final String subject;
  final String section;
  final int totalAttendance;
  int attended;

  SubjectModel({
    this.subjectCode,
    this.subject,
    this.section,
    this.totalAttendance,
    this.attended,
  });
  set setAttended(int b) {
    attended = b;
  }

  factory SubjectModel.fromJson(
      DocumentSnapshot<Map<String, dynamic>> parsedJson) {
    return SubjectModel(
      subjectCode: parsedJson.id,
      subject: parsedJson.data()['subject'],
      section: parsedJson.data()['section'],
      totalAttendance: parsedJson.data()['totalAttendance'],
    );
  }
}