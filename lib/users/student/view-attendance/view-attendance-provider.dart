import 'package:attend/index.dart';

class ViewAttendanceStudentProvider with ChangeNotifier {
  Credential cred;
  ViewAttendanceStudentProvider({this.cred});
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  // Stream<List<ViewCalendar>> get getAllAttendance {
  //   return _firebaseFirestore
  //       .collection("attendance")
  //       .where("studentUserName", isEqualTo: cred.userName)
  //       .orderBy("startedAt", descending: true)
  //       .snapshots()
  //       .map((QuerySnapshot list) => list.docs.map((QueryDocumentSnapshot d) {
  //             return ViewAttendanceStudentModel.fromJson(d).toCalendar();
  //           }).toList());
  // }

  Future<List<ViewCalendar>> getAttendance() async {
    final response = await _firebaseFirestore
        .collection("attendance")
        .orderBy("startedAt", descending: true)
        .where("studentUserName", isEqualTo: cred.userName)
        .get();
    final re = response.docs.map((QueryDocumentSnapshot d) {
      return ViewAttendanceStudentModel.fromJson(d).toCalendar();
    }).toList();
    return re;
  }
}

class ViewAttendanceStudentModel {
  final String studentUserName;
  final String teacherUserName;
  final String subjectCode;
  final String colorCode;
  final String subjectName;
  final int startedAt;
  final int endedAt;

  ViewAttendanceStudentModel({
    this.studentUserName,
    this.teacherUserName,
    this.subjectCode,
    this.startedAt,
    this.endedAt,
    this.subjectName,
    this.colorCode,
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
    );
  }
  ViewCalendar toCalendar() {
    return ViewCalendar(
        subjectName,
        DateTime.fromMicrosecondsSinceEpoch(startedAt),
        DateTime.fromMicrosecondsSinceEpoch(endedAt),
        Color(CommonWidgets.getColorFromHex(colorCode)),
        false);
  }
}
