import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/common_screens/welcome_page.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';

import '../controller/get_Admin_Details_controller.dart';
import '../model/get_Admin_details_model.dart';
import 'Admin_Home_Page.dart';
import 'admin_edit_page.dart';
class AdminAccountPage extends StatefulWidget {
  const AdminAccountPage({super.key});

  @override
  State<AdminAccountPage> createState() => _AdminAccountPageState();
}

class _AdminAccountPageState extends State<AdminAccountPage> {
  late GetAdminDetailsModel get_admin_details_data;
  bool is_load_admin_details_data = false;
  @override
  void initState() {
    super.initState();
    get_admin_details_data_method();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text("Your Profile"),
        backgroundColor: appThemeColor,
        leading: InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const Admin_Home_Page(),
                ),
              );
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        elevation: 15,
      ),
      body: is_load_admin_details_data ? SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            children: [
              SizedBox(
                width: 40.w,
                height:20.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: const Image(
                    image: AssetImage("assets/images/addProfile.png"),
                  ),
                ),
              ),
               Text("${get_admin_details_data.data!.firstName.toString()} ${get_admin_details_data.data!.lastName.toString()}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height:2.h,
              ),
               Text(
                get_admin_details_data.data!.email.toString(),
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                  width: 30.w,
                  height:5.h,
                  child: ElevatedButton(
                      onPressed:(){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const Admin_edit_page(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appThemeColor3,
                        side: BorderSide.none,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white),
                      ))),
              SizedBox(
                height: 2.h,
              ),
              const Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 2.h,
              ),
              ListTile(
                onTap: ()async{
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  await preferences.clear();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (c) => Welcome_Page()),
                          (route) => false);
                },
                leading: Container(
                  height: 10.w,
                  width: 10.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: appThemeColor2.withOpacity(0.1),
                  ),
                  child:  Icon(Icons.logout,color: appThemeColor2,),
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    color: appThemeColor.withOpacity(0.5),
                  ),
                ),
                trailing: Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: appThemeColor2.withOpacity(0.1),
                  ),
                  child:  Icon(Icons.arrow_forward_ios,color: appThemeColor2,),
                ),
              ),
              ListTile(
                leading: Container(
                  height: 10.w,
                  width: 10.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: appThemeColor2.withOpacity(0.1),
                  ),
                  child:  Icon(Icons.settings_suggest_outlined,color: appThemeColor2,),
                ),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: appThemeColor.withOpacity(0.5),
                  ),
                ),
                trailing: Container(
                  width: 10.w,
                  height: 10.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: appThemeColor2.withOpacity(0.1),
                  ),
                  child:  Icon(Icons.arrow_forward_ios,color: appThemeColor2,),
                ),
              ),
            ],
          ),
        ),
      )
          : Center(child: Text("gggg"),),
    );
  }

  void get_admin_details_data_method()async {
    get_admin_details_data = await get_admin_details_controller()
        .get_admin_details_controller_method();
    print(get_admin_details_data);
    if(get_admin_details_data.status.toString() == "200"){
      setState(() {
        is_load_admin_details_data = true;
      });
    }
  }
}
