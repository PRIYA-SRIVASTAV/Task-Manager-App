import 'package:flutter/material.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
import 'User_CalendarViewPage.dart';
import 'User_Dashboard_Page.dart';
import 'User_MyTaskPage.dart';
import 'User_Profile_Page.dart';

class User_HomePageScreen extends StatefulWidget {
  const User_HomePageScreen({super.key});

  @override
  State<User_HomePageScreen> createState() => _User_HomePageScreenState();
}

class _User_HomePageScreenState extends State<User_HomePageScreen> {
  static const List<Widget> _pages = <Widget>[
    MyTaskPage(),
    CalendarPage(),
    UserDashboardPage(),
    User_ProfilePage(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.task,
                  color: _selectedIndex==0?appThemeColor3:appThemeColor,
                ),
                label: 'My Tasks'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_month_outlined,
                color: _selectedIndex==1?appThemeColor3:appThemeColor,
              ),
              label: 'Calender View',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard_outlined,
                color: _selectedIndex==2?appThemeColor3:appThemeColor,
              ),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _selectedIndex==3?appThemeColor3:appThemeColor,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: appThemeColor3,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}
