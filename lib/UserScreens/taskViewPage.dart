import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/UserScreens/alarmViewPage.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';

import '../constants/String_constants.dart';
import '../utils/helper_widgets.dart';

class TaskViewPage extends StatefulWidget {
  const TaskViewPage({super.key});

  @override
  State<TaskViewPage> createState() => _TaskViewPageState();
}

class _TaskViewPageState extends State<TaskViewPage> {
  late TimeOfDay time;
  _selectTime() async{
    TimeOfDay? picker =
    await showTimePicker(context: context, initialTime: time);
    if(picker !=null){
      setState(() {
        time=picker;
      });
    }
  }
  @override
  void initState(){
    time = TimeOfDay.now();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(taskDetails),
          backgroundColor: appThemeColor,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: TextStyle(
                      color: appThemeColor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 0.2.h,
                ),
                cardTaskDetails(),
                SizedBox(
                  height: 2.h,
                ),
                Text(taskDescription,
                  style: TextStyle(
                    color: appThemeColor2,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp
                  ),
                ),
                SizedBox(
                  height: 0.2.h,
                ),
                cardTaskDetails(),
                SizedBox(
                  height: 2.h,
                ),

                Text("Duration",
                  style: TextStyle(
                      color: appThemeColor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp
                  ),
                ),
                SizedBox(
                  height: 0.2.h,
                ),
                cardTaskDetails(),
                SizedBox(
                  height: 2.h,
                ),

                Text("Submit Date",
                  style: TextStyle(
                      color: appThemeColor2,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp
                  ),
                ),
                SizedBox(
                  height: 0.2.h,
                ),
                cardTaskDetails(),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 2.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Priority",
                      style: TextStyle(
                          color: appThemeColor2,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp
                      ),
                    ),
                    Text("High",style:TextStyle(fontWeight: FontWeight.w900,fontSize: 14.sp,color:Colors.black54),)
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Start Date",
                          style:TextStyle(color: appThemeColor2,fontWeight: FontWeight.bold,fontSize: 14.sp),
                        ),
                        SizedBox(height: 0.2.h,),
                        Text("13/10/2023",style:TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54
                        ) ,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text("End Date",
                          style:TextStyle(color: appThemeColor2,fontWeight: FontWeight.bold,fontSize: 14.sp),
                        ),
                        SizedBox(height: 0.2.h,),
                        Text("13/11/2023",style:TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54
                        ) ,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(setReminder,
                      style: TextStyle(
                          color: appThemeColor2,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp
                      ),
                    ),
                    // Text("${time.hour}:${time.minute}",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w700,color: Colors.black54),),

                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AlarmReminder()),
                          );
                        },
                        child: Icon((Icons.alarm))),

                  ],
                ),
                SizedBox(height: 4.h,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(onPressed: (){},
                        child: Text("Save")
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
