import 'package:attend/index.dart';

class ViewAttendanceStudent extends StatefulWidget {
  const ViewAttendanceStudent({Key key}) : super(key: key);

  @override
  _ViewAttendanceStudentState createState() => _ViewAttendanceStudentState();
}

class _ViewAttendanceStudentState extends State<ViewAttendanceStudent> {
  var _init = true;
  var isLoading = true;
  List<ViewCalendar> listofDates = [];
  Attended attend = Attended();
  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (_init) {
      _init = false;
      setState(() {
        isLoading = true;
      });
      final list = await Provider.of<ViewAttendanceStudentProvider>(context,
              listen: false)
          .getAttendance();
      final attended = await Provider.of<ViewAttendanceStudentProvider>(context,
              listen: false)
          .getTotalAttendance();
      setState(() {
        listofDates.addAll(list);
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isLoading: isLoading,
      padding: const EdgeInsets.all(0),
      appBar: CustomAppBar(
        text: "Attendance",
      ),
      children: [
        Expanded(
            child: SfCalendar(
          view: CalendarView.month,
          dataSource: ViewCalendarDataSource(listofDates),
          allowedViews: [
            CalendarView.day,
            CalendarView.week,
            CalendarView.month,
            CalendarView.schedule
          ],
          timeSlotViewSettings: TimeSlotViewSettings(
            startHour: 8,
            endHour: 24,
            timeIntervalHeight: 60,
          ),
          resourceViewSettings: ResourceViewSettings(),
          showDatePickerButton: true,
          backgroundColor: Scaffold().backgroundColor,
          allowViewNavigation: true,
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ))
      ],
    );
  }

  List<ViewCalendar> _getDataSource() {
    final List<ViewCalendar> meetings = <ViewCalendar>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(ViewCalendar(
        'Conference', startTime, endTime, const Color(0xFF0F8644), true));
    return meetings;
  }
}
