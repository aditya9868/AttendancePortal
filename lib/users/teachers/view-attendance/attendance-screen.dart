import 'package:attend/index.dart';

class ViewTeacherAttendance extends StatefulWidget {
  @override
  _ViewTeacherAttendanceState createState() => _ViewTeacherAttendanceState();
}

class _ViewTeacherAttendanceState extends State<ViewTeacherAttendance> {
  List<ViewCalendar> _getDataSource() {
    final List<ViewCalendar> meetings = <ViewCalendar>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(ViewCalendar('Conference', startTime, endTime, const Color(0xFF0F8644), true));
    return meetings;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        text: 'Attendance',
      ),
      children: [
        Expanded(
          child: SfCalendar(
            view: CalendarView.month,
            dataSource: ViewCalendarDataSource(_getDataSource()),
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
          ),
        )
      ],
    );
  }
}
