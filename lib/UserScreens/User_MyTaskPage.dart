import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/UserScreens/User_task_details_page.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
import 'package:taskmanagerapp/controller/get_user_task_list_controller.dart';
import '../model/get_user_task_list_model.dart';
import 'CustomDrawer.dart';

class MyTaskPage extends StatefulWidget {
  const MyTaskPage({super.key});

  @override
  State<MyTaskPage> createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {
  late GetTaskLisModel user_task_data;
  bool is_load_task_list = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      // initialIndex: widget.TabIndex,
      child: Scaffold(
        //backgroundColor: appThemeColor,
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25.h),
                  ),
                  child: TabBar(
                    labelStyle:
                        TextStyle(fontSize: 9.sp, fontWeight: FontWeight.bold),
                    indicator: BoxDecoration(
                      color: appThemeColor,
                      borderRadius: BorderRadius.circular(25.h),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(
                        text: 'All Task',
                      ),
                      Tab(
                        text: 'Pending Task',
                      ),
                      Tab(
                        text: 'Completed Task',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 70.h,
                  width: 100.w,
                  child: TabBarView(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const User_task_details_page(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: appThemeColor.withOpacity(0.2),
                                ),
                                width: double.infinity,
                                height: 10.h,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.5.h, horizontal: 5.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Lorem Ipsum Task',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(Icons.calendar_month),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Text("23-10-2023")
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                    Icons
                                                    .low_priority_outlined),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Text("High")
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount:3,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const User_task_details_page(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: appThemeColor.withOpacity(0.2),
                                ),
                                width: double.infinity,
                                height: 10.h,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.5.h, horizontal: 5.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Lorem Ipsum Task',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(Icons.calendar_month),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Text("23-10-2023")
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(Icons
                                                    .low_priority_outlined),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Text("High")
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const User_task_details_page(),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: appThemeColor.withOpacity(0.2),
                                ),
                                width: double.infinity,
                                height: 10.h,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.5.h, horizontal: 5.w),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Lorem Ipsum Task',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(Icons.calendar_month),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Text("23-10-2023")
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(Icons
                                                    .low_priority_outlined),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Text("High")
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void fetch_uaser_task() async {
    user_task_data = await get_user_task_list_controller()
        .get_user_task_list_controller_method();
    if (user_task_data.status.toString() == "200") {
      setState(() {
        is_load_task_list = true;
      });
    }
  }
}
