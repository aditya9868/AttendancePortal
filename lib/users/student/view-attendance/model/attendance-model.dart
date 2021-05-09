import 'package:attend/index.dart';

class ViewAttendanceStudentModel {
  final String studentUserName;
  final String teacherUserName;
  final String subjectCode;
  final String colorCode;
  final String subjectName;
  final int startedAt;
  final int endedAt;
  final bool isPresent;

  ViewAttendanceStudentModel({
    this.studentUserName,
    this.teacherUserName,
    this.subjectCode,
    this.startedAt,
    this.endedAt,
    this.subjectName,
    this.colorCode,
    this.isPresent = false,
  });
  factory ViewAttendanceStudentModel.fromJson(var parsedJson) {
    return ViewAttendanceStudentModel(
        studentUserName: parsedJson['studentUserName'].toString(),
        teacherUserName: parsedJson['teacherUserName'].toString(),
        subjectCode: parsedJson['subjectCode'].toString(),
        startedAt: parsedJson['startedAt'].toInt(),
        endedAt: parsedJson['endedAt'].toInt(),
        subjectName: parsedJson['subjectName'].toString(),
        colorCode: parsedJson['colorCode'].toString(),
        isPresent: parsedJson['present']);
  }

  ViewCalendar toCalendar() {
    final color = CommonWidgets.convertAnyStringToHex(subjectCode);
    return ViewCalendar(
        subjectName,
        DateTime.fromMicrosecondsSinceEpoch(startedAt),
        DateTime.fromMicrosecondsSinceEpoch(endedAt),
        Color(CommonWidgets.getColorFromHex(color.toUpperCase())),
        false);
  }
}

class Attended {
  final int present;
  final int total;

  Attended({this.present = 0, this.total = 0});
  int get absent => total - present;
}
