import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/AdminScreens/Admin_Home_Page.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
import 'package:taskmanagerapp/controller/Get_Assignee_Controller.dart';

import '../constants/Pref_constants.dart';
import '../controller/create_task_controller.dart';
import '../model/get_Assignee_Data_model.dart';
import '../utils/helper_methods.dart';

class Admin_Create_New_Task extends StatefulWidget {
  const Admin_Create_New_Task({super.key});

  @override
  State<Admin_Create_New_Task> createState() =>
      _Admin_Create_New_TaskState();
}

class _Admin_Create_New_TaskState extends State<Admin_Create_New_Task> {
  String? selectedValue;
  String? dropdownvalue;
  String? dropdownvalueName;
  List<String> items = [
    'Higher',
    'Medium',
    'Low',
  ];
  TextEditingController taskController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  late GetAssigneDataModel fetch_data;
  bool is_loading_assignee = false;

  @override
  void initState() {
    fetch_assignee_data();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    taskController.dispose();
    dateController.dispose();
    descriptionController.dispose();
    durationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Task"),
        backgroundColor: appThemeColor,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Admin_Home_Page(),
                ),
              );
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined)),
        elevation: 15,
      ),
      body: is_loading_assignee
          ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(4.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Task Title",
                      style: TextStyle(
                          color: appThemeColor2,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      controller: taskController,
                      decoration: const InputDecoration(
                        hintText: "Enter title",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Created On",
                      style: TextStyle(
                          color: appThemeColor2,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () async {
                              DateTime? pickedDate =
                              await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100),
                                helpText: "CHOOSE DATE",
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: appThemeColor,
                                        onPrimary: Colors.white,
                                        onSurface: Colors.black,
                                      ),
                                      textButtonTheme:
                                      TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors
                                              .green, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                DateFormat('yyyy-MM-dd')
                                    .format(pickedDate);
                                print(formattedDate);
                                setState(() {
                                  dateController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                            child: Icon(Icons.calendar_month)),
                        border: UnderlineInputBorder(),
                      ),

                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Task Description",
                      style: TextStyle(
                          color: appThemeColor2,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        hintText: "Enter task description",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Task Duration",
                      style: TextStyle(
                          color: appThemeColor2,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    TextFormField(
                      controller: durationController,
                      decoration: const InputDecoration(
                        hintText: "Enter task duration",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Task Priority",
                      style: TextStyle(
                          color: appThemeColor2,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: DropdownButton(
                          value: selectedValue,
                          menuMaxHeight: 50.h,
                          borderRadius: BorderRadius.circular(7),
                          elevation: 10,
                          underline: const SizedBox(),
                          isExpanded: true,
                          hint: const Text('Priority'),
                          items: items.map((item) {
                            return DropdownMenuItem(
                              value: item.toString(),
                              child: Text(item.toString()),
                            );
                          }).toList(),
                          onChanged: (String? val) {
                            setState(() {
                              selectedValue = val!;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Assignee",
                      style: TextStyle(
                          color: appThemeColor2,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w, right: 5.w),
                        child: DropdownButton(
                          value: dropdownvalue,
                          menuMaxHeight: 50.h,
                          borderRadius: BorderRadius.circular(7),
                          elevation: 10,
                          underline: const SizedBox(),
                          isExpanded: true,
                          hint: const Text('Assignee'),
                          items: fetch_data.data!.map((item) {
                            return DropdownMenuItem(
                              value: item.id.toString(),
                              child: Text(item.firstName.toString()),
                            );
                          }).toList(),
                          onChanged: (String? val) {
                            setState(() {
                              dropdownvalue = val!;
                              var a = fetch_data.data
                                  .indexWhere((e) => e.id.toString() == val!);
                              dropdownvalueName = fetch_data.data[a].firstName;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          backgroundColor: appThemeColor3,
          child: const Icon(
            Icons.check,
          ),
          onPressed: () async {
            var admin_id;
            await getPref().then((value) {
              admin_id = value.getString(KEYID);
            });
            print("@@@@@@@@@@@@@@@@@@@ $admin_id");
            create_task_controller().create_task_controller_method(
                taskController.text,
                dateController.text,
                descriptionController.text,
                selectedValue,
                durationController.text,
                dropdownvalueName,
                dropdownvalue,
                admin_id,
                context);
          },
        ),
      ),
    );
  }

  void fetch_assignee_data() async {
    fetch_data = await get_assignee_controller().get_assignee_controller_method();
    setState(() {
      is_loading_assignee = true;
    });
  }
}
