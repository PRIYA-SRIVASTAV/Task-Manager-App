import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
import 'package:taskmanagerapp/controller/get_admin_dashboard_controller.dart';
import '../model/get_admin_dashboard_data_model.dart';


class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int key = 0;
  Map<String, double> dataMap = {};
  List<Color> colorList = [appThemeColor3, appThemeColor2];

  late GetAdminDashboardDataModel get_admin_dashboard_data;
  bool is_load_admin_dashboard = false;

  @override
  void initState() {
    super.initState();
    get_admin_dashboard_data_method();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DashBoard"),
        backgroundColor: appThemeColor,
        leading: const Icon(Icons.dashboard_outlined),
        elevation: 15,
      ),
      body: is_load_admin_dashboard
          ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40.h,
                      width: double.infinity,
                      child: pieChartOne(),
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           const AdminTotalTaskDescriptionPage()),
                        // );
                      },
                      child: Container(
                        height: 15.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: appThemeColor),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              get_admin_dashboard_data.data.totalTask
                                  .toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.sp),
                            ),
                            Text(
                              "Total Task",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.sp),
                            ),
                          ],
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 20.h,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const AdminCompletedDescriptionPage()),
                              // );
                            },
                            child: Container(
                              height: 15.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: appThemeColor3),
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    get_admin_dashboard_data.data.completedTask
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.sp),
                                  ),
                                  Text(
                                    "Completed",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.sp),
                                  ),
                                ],
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           const AdminPendingDescriptionPage()),
                              // );
                            },
                            child: Container(
                              height: 15.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: appThemeColor2),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      get_admin_dashboard_data.data.pendingTask
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.sp),
                                    ),
                                    Text(
                                      "Pending",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : const Center(
              child: Center(
                child: Text("Task not found !!!"),
              ),
            ),
    );
  }

  Widget pieChartOne() {
    return PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      initialAngleInDegree: 0,
      animationDuration: const Duration(milliseconds: 2000),
      chartType: ChartType.ring,
      chartRadius: 150,
      ringStrokeWidth: 40,
      colorList: colorList,
      chartLegendSpacing: 5.h,
      chartValuesOptions: ChartValuesOptions(
          showChartValuesOutside: true,
          showChartValuesInPercentage: true,
          showChartValueBackground: true,
          showChartValues: true,
          chartValueStyle:
              TextStyle(fontWeight: FontWeight.bold, color: appThemeColor)),
      centerText: 'Task Status',
      legendOptions: LegendOptions(
          showLegendsInRow: false,
          showLegends: true,
          legendShape: BoxShape.rectangle,
          legendPosition: LegendPosition.bottom,
          legendTextStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: appThemeColor)),
    );
  }

  void get_admin_dashboard_data_method() async {
    get_admin_dashboard_data = await get_admin_dashboard_controller()
        .get_admin_dashboard_controller_method();
    Map<String, double> percentage = {
      'Completed Task':
          double.parse(get_admin_dashboard_data.data.compPerc.toString()),
      'Pending Task':
          double.parse(get_admin_dashboard_data.data.pendingPerc.toString())
    };
    dataMap = percentage;
    if (get_admin_dashboard_data.status.toString() == "200") {
      setState(() {
        is_load_admin_dashboard = true;
      });
    }
  }
}
