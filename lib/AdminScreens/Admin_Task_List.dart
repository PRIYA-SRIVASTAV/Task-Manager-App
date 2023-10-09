import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/constants/Pref_constants.dart';
import 'package:taskmanagerapp/controller/Admin_update_task_controller.dart';
import 'package:taskmanagerapp/controller/admin_task_delete_controller.dart';
import 'package:taskmanagerapp/controller/get_admin_task_list_controller.dart';
import '../constants/color_constants.dart';
import '../model/get_admin_task_list_model.dart';
import '../utils/helper_methods.dart';
import 'Admin_Home_Page.dart';

class Admin_Task_List extends StatefulWidget {
  const Admin_Task_List({super.key});

  @override
  State<Admin_Task_List> createState() => _Admin_Task_ListState();
}

class _Admin_Task_ListState extends State<Admin_Task_List> {
  TextEditingController titleController = TextEditingController();
  TextEditingController created_onController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  late GetAdminTaskListModel get_admin_task_list;
  bool is_load_admin_task_list = false;

  @override
  void initState() {
    super.initState();
    get_admin_task_list_method();
  }
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    created_onController.dispose();
    descriptionController.dispose();
    durationController.dispose();
  }
  Widget update_task(index) {
    return SimpleDialog(
      children: [
        Container(
          height: 55.h,
          child: Stack(
            // alignment: Alignment.topRight,
            children: [
              SingleChildScrollView(
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
                        controller: titleController,
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
                        controller: created_onController,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
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
                                        textButtonTheme: TextButtonThemeData(
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
                                    created_onController.text =
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
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appThemeColor3,
                            side: BorderSide.none,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                            var task_id;
                            await getPref().then((value) {
                              value.setString(
                                  KEYTASKID,
                                  get_admin_task_list.data[index].id
                                      .toString());
                            });
                            await getPref().then((value) {
                              task_id = value.getString(KEYTASKID);
                            });
                            print("-----------task id------ $task_id");
                             await Admin_update_task_controller()
                                .Admin_update_task_controller_method(
                                 task_id,
                                    titleController.text,
                                    created_onController.text,
                                    descriptionController.text,
                                    durationController.text,
                                    context);
                          },
                          child: Text(
                            "Update Task",
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 1.w,
                top: 0.5.h,
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
      ],
    );
  }

  Widget _listItem(index) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black26))),
      child: ListTile(
        leading:
            Text((index + 1).toString(), style: TextStyle(fontSize: 12.sp)),
        title: Text(
          get_admin_task_list.data[index].title.toString(),
          style: TextStyle(fontSize: 12.sp),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return update_task(index);
                  },
                );
              },
              child: Icon(Icons.edit, color: appThemeColor3),
            ),
            SizedBox(
              width: 2.h,
            ),
            InkWell(
              onTap: () async{
                var task_id;
                await getPref().then((value) {
                  value.setString(
                      KEYTASKID,
                      get_admin_task_list.data[index].id
                          .toString());
                });
                await getPref().then((value) {
                  task_id = value.getString(KEYTASKID);
                });
                print("-----------task id------ $task_id");
                admin_task_delete_controller().admin_task_delete_controller_method(task_id,context);
              },
              child: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Task List"),
          backgroundColor: appThemeColor,
          leading: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Admin_Home_Page(),
                  ),
                );
              },
              child: const Icon(Icons.arrow_back_ios_new)),
          elevation: 15,
        ),
        body: is_load_admin_task_list
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (_, index) {
                          return _listItem(index);
                        },
                        itemCount: get_admin_task_list.data.length,
                      ),
                    ),
                  ],
                ),
              )
            : const Center(
                child: Text("Task not found !!!"),
              ));
  }

  void get_admin_task_list_method() async {
    get_admin_task_list = await get_admin_task_list_controller()
        .get_admin_task_list_controller_method();
    if (get_admin_task_list.status.toString() == "200") {
      setState(() {
        is_load_admin_task_list = true;
      });
    }
  }
}
