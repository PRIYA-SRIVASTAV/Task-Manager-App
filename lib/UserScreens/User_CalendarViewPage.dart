import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime today = DateTime.now();

  void onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar View"),
        backgroundColor: Theme.of(context).primaryColor,
        leading: const Icon(Icons.calendar_month_outlined),
        elevation: 15,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              today.toString().split(" ")[0],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            TableCalendar(
              locale: "en_US",
              rowHeight: 43,
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false, titleCentered: true),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              onDaySelected: onDaySelected,
            ),
          ],
        ),
      ),
    );
  }
}
