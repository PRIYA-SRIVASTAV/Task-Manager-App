import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
class AdminTotalTaskDescriptionPage extends StatefulWidget {
  const AdminTotalTaskDescriptionPage({super.key});

  @override
  State<AdminTotalTaskDescriptionPage> createState() => _AdminTotalTaskDescriptionPageState();
}

class _AdminTotalTaskDescriptionPageState extends State<AdminTotalTaskDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appThemeColor,
        title: const Text("Total Task"),
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
                padding:  EdgeInsets.symmetric(horizontal:1.h),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    Text("Task id",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
                    Text("Task name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
                    Text("Priority",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14.sp),),
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
                          trailing:Text(
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
