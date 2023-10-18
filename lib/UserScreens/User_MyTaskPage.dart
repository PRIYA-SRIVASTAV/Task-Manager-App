import 'package:flutter/material.dart';
import 'package:taskmanagerapp/UserScreens/taskViewPage.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
import 'package:taskmanagerapp/controller/get_user_task_list_controller.dart';

import '../model/get_user_task_list_model.dart';

class MyTaskPage extends StatefulWidget {
  const MyTaskPage({super.key});

  @override
  State<MyTaskPage> createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {
  late GetTaskLisModel user_task_data;
  bool is_load_task_list = false;

  @override
  void initState() {
    super.initState();
    fetch_uaser_task();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: appThemeColor,
        appBar: AppBar(
          title: const Text("Your Tasks"),
          backgroundColor: appThemeColor,
          leading: const Icon(Icons.task_outlined),
          elevation: 15,
        ),
        body: is_load_task_list
            ? SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: ListView.builder(
                        itemCount: user_task_data.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Text(
                              user_task_data.data[index].id.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            trailing: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      appThemeColor3)),
                              child: const Text("Accept"),
                              onPressed: (){
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context){
                                      return TaskViewPage();
                                    })
                                );
                              },
                            ),
                            title: Text(
                              user_task_data.data[index].title.toString(),
                              style: TextStyle(
                                  color: appThemeColor2,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              "Duration : ${user_task_data.data[index].duration.toString()}",
                              style: TextStyle(color: appThemeColor),
                            ),
                          );
                        }),
                    // Center(
                    //     child: Text(
                    //   'No tasks available',
                    //   style: TextStyle(color: Colors.black54),
                    // )),
                  ),
                ),
              )
            : Center(
                child: Center(child: Text("Task not found !!!"),),
              ));
  }

  void fetch_uaser_task() async {
    user_task_data = await get_user_task_list_controller().get_user_task_list_controller_method();
    if (user_task_data.status.toString() == "200") {
      setState(() {
        is_load_task_list = true;
      });
    }
  }
}
