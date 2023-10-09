import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
class AdminPendingDescriptionPage extends StatefulWidget {
  const AdminPendingDescriptionPage({super.key});

  @override
  State<AdminPendingDescriptionPage> createState() => _AdminPendingDescriptionPageState();
}

class _AdminPendingDescriptionPageState extends State<AdminPendingDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appThemeColor,
        title: const Text("Pending Task"),
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
