import 'package:attend/index.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        text: "Dashboard",
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
      ],
    );
  }
}
