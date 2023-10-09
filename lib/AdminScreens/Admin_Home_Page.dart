import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/AdminScreens/Admin_Create_New_TaskPage.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
import '../AdminScreens/Admin_Profile_Page.dart';
import 'Admin_CreateEmployeePage.dart';
import 'Admin_DashboardPage.dart';
import 'Admin_Task_List.dart';

class Admin_Home_Page extends StatefulWidget {
  const Admin_Home_Page({super.key});

  @override
  State<Admin_Home_Page> createState() => _Admin_Home_PageState();
}

class _Admin_Home_PageState extends State<Admin_Home_Page> {
  static const List<Widget> _pages = <Widget>[
    AdminDashboard(),
    Admin_CreateEmployeePage(),
    Admin_Task_List(),
    Admin_Create_New_Task(),
    AdminAccountPage(),
  ];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.dashboard_outlined,
                    size: 28.sp,
                    color: _selectedIndex==0?appThemeColor3:appThemeColor,
                  ),
                  label: 'Dashboard'),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_add_alt_1_sharp,
                  size: 28.sp,
                  color: _selectedIndex==1?appThemeColor3:appThemeColor,
                ),
                label: 'Create Emp',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 28.sp,
                  color:_selectedIndex==2?appThemeColor3:appThemeColor,
                ),
                label: 'Task List',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_task,
                  size: 28.sp,
                  color:_selectedIndex==3?appThemeColor3:appThemeColor,
                ),
                label: 'Create Task',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_pin_rounded,
                  size: 28.sp,
                  color:_selectedIndex==4?appThemeColor3:appThemeColor,
                ),
                label: 'Account',
              ),
            ],
            //type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            selectedItemColor: appThemeColor3,
            iconSize: 40.sp,
            onTap: _onItemTapped,
            elevation: 5),
        body: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
