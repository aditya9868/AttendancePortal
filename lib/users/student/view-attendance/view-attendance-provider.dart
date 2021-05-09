import 'package:attend/index.dart';

class ViewAttendanceStudentProvider with ChangeNotifier {
  Credential cred;
  ViewAttendanceStudentProvider({this.cred});
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<List<ViewCalendar>> getAttendance() async {
    final response = await _firebaseFirestore
        .collection("attendance")
        .orderBy("startedAt", descending: true)
        .where("studentUserName", isEqualTo: cred.userCredential.userName)
        .get();
    final re = response.docs.map((QueryDocumentSnapshot d) {
      return ViewAttendanceStudentModel.fromJson(d).toCalendar();
    }).toList();
    return re;
  }

  Future<List<ViewCalendar>> getListSubjectAttendance(
      StudentSubjectModel sub) async {
    final response = await _firebaseFirestore
        .collection("attendance")
        .orderBy("startedAt", descending: true)
        .where(
          "studentUserName",
          isEqualTo: cred.userCredential.userName,
        )
        .where("subjectCode", isEqualTo: sub.subjectCode)
        .get();
    final re = response.docs.map((QueryDocumentSnapshot d) {
      return ViewAttendanceStudentModel.fromJson(d).toCalendar();
    }).toList();
    return re;
  }

  Future<List<StudentSubjectModel>> getAllSubjects() async {
    final rawRes = await _firebaseFirestore
        .collection("users")
        .doc(cred.userCredential.userName)
        .collection("subjects")
        .get();
    final res =
        rawRes.docs.map((e) => StudentSubjectModel.fromJson(e)).toList();
    return res;
  }

  Future<SubjectModel> getSubjectAttendance(StudentSubjectModel subject) async {
    final rawRes = await _firebaseFirestore
        .collection("users")
        .doc(subject.teacherUserName)
        .collection("subjects")
        .doc(subject.subjectCode)
        .get();

    final res = SubjectModel.fromJson(rawRes);
    final response = await _firebaseFirestore
        .collection("attendance")
        .orderBy("startedAt", descending: true)
        .where(
          "studentUserName",
          isEqualTo: cred.userCredential.userName,
        )
        .where("subjectCode", isEqualTo: subject.subjectCode)
        .where("present", isEqualTo: true)
        .get();
    res.setAttended = response.docs.length;
    return res;
  }

  Future<Attended> getTotalAttendance() async {
    int total = 0;
    int present = 0;
    final allSubject = await getAllSubjects();
    for (var sub in allSubject) {
      final p = await getSubjectAttendance(sub);
      total += p.totalAttendance;
      present += p.attended;
    }

    return Attended(present: present, total: total);
  }
}
