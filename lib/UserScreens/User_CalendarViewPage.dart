import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants/color_constants.dart';
import 'CustomDrawer.dart';

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
        elevation: 0.0,
        title: Text(
          "My Tasks",
        ),
        leading: Builder(
          builder: (context) =>
              IconButton(
                icon: const Icon(Icons.menu), // Icon to represent the drawer
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Open the drawer
                },
              ),
        ),
        backgroundColor: appThemeColor,
      ),
      //drawer: const AppDrawer(),
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
