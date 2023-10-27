import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:sizer/sizer.dart';
import '../constants/color_constants.dart';


class User_task_details_page extends StatefulWidget {
  const User_task_details_page({super.key});

  @override
  State<User_task_details_page> createState() => _User_task_details_pageState();
}

class _User_task_details_pageState extends State<User_task_details_page> {
  TextEditingController ReasonController = TextEditingController();
  TextEditingController CommentController = TextEditingController();
  late TimeOfDay time;

  _selectTime() async {
    TimeOfDay? picker =
        await showTimePicker(context: context, initialTime: time);
    if (picker != null) {
      setState(() {
        time = picker;
      });
    }
  }

  @override
  void initState() {
    time = TimeOfDay.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new)),
        title: Text("Task Detail"),
        backgroundColor: appThemeColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 1.5.h,
                    width: 0.75.w,
                    color: appThemeColor,
                  ),
                  SizedBox(
                    width: 0.5.h,
                  ),
                  Text(
                    "Title",
                    style: TextStyle(
                        color: appThemeColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height:0.2.h,
              ),
              Card(
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Make post of company",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Container(
                    height: 1.5.h,
                    width: 0.75.w,
                    color: appThemeColor,
                  ),
                  SizedBox(
                    width: 0.5.h,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        color: appThemeColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 0.2.h,
              ),
              Card(
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Container(
                    height: 1.5.h,
                    width: 0.75.w,
                    color: appThemeColor,
                  ),
                  SizedBox(
                    width: 0.5.h,
                  ),
                  Text(
                    "Duration",
                    style: TextStyle(
                        color: appThemeColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 0.2.h,
              ),
              Card(
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "2 hour",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Container(
                    height: 1.5.h,
                    width: 0.75.w,
                    color: appThemeColor,
                  ),
                  SizedBox(
                    width: 0.5.h,
                  ),
                  Text(
                    "Submit Date",
                    style: TextStyle(
                        color: appThemeColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 0.2.h,
              ),
              Card(
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "23-10-2023",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Container(
                    height: 1.5.h,
                    width: 0.75.w,
                    color: appThemeColor,
                  ),
                  SizedBox(
                    width: 0.5.h,
                  ),
                  Text(
                    "Priority",
                    style: TextStyle(
                        color: appThemeColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 0.2.h,
              ),
              Card(
                color: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "High",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 1.5.h,
                        width: 0.75.w,
                        color: appThemeColor,
                      ),
                      SizedBox(
                        width: 0.5.h,
                      ),
                      Text(
                        "Set Reminder",
                        style: TextStyle(
                            color: appThemeColor2,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      FlutterAlarmClock.showAlarms();
                    },
                    child:  Icon(color: appThemeColor3,size: 30.sp,
                      (Icons.alarm),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 1.5.h,
                        width: 0.75.w,
                        color: appThemeColor,
                      ),
                      SizedBox(
                        width: 0.5.h,
                      ),
                      Text(
                        "Unable to do task !",
                        style: TextStyle(
                            color: appThemeColor2,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 25.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty
                              .all(
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                  20),
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty
                              .all(Theme.of(
                              context)
                              .primaryColor),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Unable_to_solve_dialog(
                                  context);
                            },
                          );
                        },
                        child: Text(
                          "Reason",
                          style: TextStyle(
                              fontSize: 10.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 1.5.h,
                        width: 0.75.w,
                        color: appThemeColor,
                      ),
                      SizedBox(
                        width: 0.5.h,
                      ),
                      Text(
                        "Task completed ?",
                        style: TextStyle(
                            color: appThemeColor2,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: SizedBox(
                      width: 27.w,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                          MaterialStateProperty
                              .all(
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius
                                  .circular(
                                  20),
                            ),
                          ),
                          backgroundColor:
                          MaterialStateProperty
                              .all(Theme.of(
                              context)
                              .primaryColor),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Completed_dialog(
                                  context);
                            },
                          );
                        },
                        child: Text(
                          "Completed",
                          style: TextStyle(
                              fontSize: 10.sp),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget Unable_to_solve_dialog(context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Container(
            height: 30.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Unable to do task !",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: appThemeColor),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        TextFormField(
                          controller: ReasonController,
                          maxLength: 100,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.note_alt),
                              border: UnderlineInputBorder(),
                              hintText: "Enter reason"),
                        ),
                        SizedBox(height: 3.h),
                        Center(
                          child: SizedBox(
                            height: 5.h,
                            width: 30.w,
                            child: ElevatedButton(
                              onPressed: () async {
                                // await post_work_reason_controller()
                                //     .post_work_reason_controller_method(
                                //     get_work_order_status2
                                //         .data[widget.index].workId
                                //         .toString(),
                                //     ReasonController.text,
                                //     context);
                                // ReasonController.clear();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: appThemeColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                              ),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  top: 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        key: Key('closeIconKey'),
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget Completed_dialog(context) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Dialog(
          child: Container(
            height: 30.h,
            child: Stack(
              // alignment: Alignment.topRight,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Task completed !",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: appThemeColor),
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        TextFormField(
                          controller: ReasonController,
                          maxLength: 100,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(Icons.note_alt),
                              border: UnderlineInputBorder(),
                              hintText: "comment"),
                        ),
                        SizedBox(height: 3.h),
                        Center(
                          child: SizedBox(
                            height: 5.h,
                            width: 30.w,
                            child: ElevatedButton(
                              onPressed: () async {
                                // await post_work_reason_controller()
                                //     .post_work_reason_controller_method(
                                //     get_work_order_status2
                                //         .data[widget.index].workId
                                //         .toString(),
                                //     ReasonController.text,
                                //     context);
                                // ReasonController.clear();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: appThemeColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder(),
                              ),
                              child: Text(
                                "Save",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  top: 2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        key: Key('closeIconKey'),
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}
