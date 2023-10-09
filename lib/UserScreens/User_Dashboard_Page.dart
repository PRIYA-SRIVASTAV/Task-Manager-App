import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
import 'package:taskmanagerapp/controller/get_user_dashboard_controller.dart';
import '../model/get_user_dashboard_data_model.dart';


class UserDashboardPage extends StatefulWidget {
  const UserDashboardPage({super.key});

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  int key = 0;
  Map<String, double> dataMap = {};
  List<Color> colorList = [appThemeColor3, appThemeColor2];

  late GetUserDashboardModel get_dashboard_data;
  bool is_load_user_dashboard = false;

  @override
  void initState() {
    super.initState();
    get_user_dashboard_data();
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
        body: is_load_user_dashboard
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
                          //           const UserTotalTaskDescriptionPage()),
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
                                get_dashboard_data.data.totalTask.toString(),
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
                                //           const UserCompletedDescriptionPage()),
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
                                      get_dashboard_data.data.completedTask.toString(),
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
                                //           const UserPendingDescriptionPage()),
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
                                        get_dashboard_data.data.pendingTask.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.sp),
                                      ),
                                      Text(
                                        "Pending",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.sp),
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
            : Center(
                child: Center(child: Text("Task not found !!!"),),
              ));
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

  void get_user_dashboard_data() async {
    get_dashboard_data = await get_user_dashboard_controller().get_user_dashboard_controller_method();
    Map<String, double> percentage = {
      'Completed Task':
          double.parse(get_dashboard_data.data.compPerc.toString()),
      'Pending Task':
          double.parse(get_dashboard_data.data.pendingPerc.toString())
    };
    dataMap = percentage;
    if (get_dashboard_data.status.toString() == "200") {
      setState(() {
        is_load_user_dashboard = true;
      });
    }
  }
}
