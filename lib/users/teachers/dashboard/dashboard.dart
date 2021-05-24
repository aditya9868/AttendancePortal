import 'package:attend/index.dart';

class TeacherDashboard extends StatefulWidget {
  TeacherDashboard({Key key}) : super(key: key);

  @override
  _TeacherDashboardState createState() => _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        text: "TeacherDashboard",
        showPrefix: false,
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      isScrollable: true,
      children: [
        DashboardCard(
          subtitle: "QR Code",
          title: " Scanner",
          colors: AppColor.card1,
          icon: Icons.qr_code_scanner_outlined,
          onPressed: () async {
            CommonWidgets.push(context, QrScreen());
          },
        ),
        DashboardCard(
          subtitle: "View",
          title: "Attendance",
          colors: AppColor.card2,
          icon: Icons.grading_outlined,
          onPressed: () async {
            CommonWidgets.push(context, ViewAttendanceStudent());
          },
        ),
        DashboardCard(
          subtitle: "Mark",
          title: "Attendance",
          colors: AppColor.card3,
          icon: Icons.grading_outlined,
          onPressed: () async {
            CommonWidgets.push(context, ViewAttendanceStudent());
          },
        ),
      ],
    );
  }
}
