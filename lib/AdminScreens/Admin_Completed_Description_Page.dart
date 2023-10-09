import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
class AdminCompletedDescriptionPage extends StatefulWidget {
  const AdminCompletedDescriptionPage({super.key});

  @override
  State<AdminCompletedDescriptionPage> createState() => _AdminCompletedDescriptionPageState();
}

class _AdminCompletedDescriptionPageState extends State<AdminCompletedDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:appThemeColor,
        title: const Text("Completed Task"),
        leading:InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new,)),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text("Task Id",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
                    Text("Task name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
                    Text("Status",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
                    Text("Assignee",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height:100.h,
                child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: const Icon(Icons.list),
                          trailing:  Text(
                            "GFG",
                            style: TextStyle(color: Colors.green, fontSize: 15.sp),
                          ),
                          title: Text("List item $index"));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
