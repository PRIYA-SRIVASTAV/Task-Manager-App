import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import '../constants/color_constants.dart';
import '../controller/Admin_update_profile_data_controller.dart';
import '../controller/get_Admin_Details_controller.dart';
import '../model/get_Admin_details_model.dart';
import 'Admin_Home_Page.dart';

class Admin_edit_page extends StatefulWidget {
  const Admin_edit_page({Key? key}) : super(key: key);

  @override
  State<Admin_edit_page> createState() => _Admin_edit_pageState();
}

class _Admin_edit_pageState extends State<Admin_edit_page> {
  TextEditingController nameController = TextEditingController();
  late GetAdminDetailsModel get_admin_details;
  bool is_load_admin_details = false;

  @override
  void initState() {
    super.initState();
    get_admin_details_data();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appThemeColor,
          title: const Text("Edit Your Profile"),
          leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Admin_Home_Page(),
                ),
              );
            },
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: is_load_admin_details
            ? SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: Column(
                    children: [
                      Container(
                        height: 30.h,
                        width: 100.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/8690523_3959384-removebg-preview.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 4.h, right: 4.h, bottom: 4.h, top: 4.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Detail !",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: appThemeColor),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Name",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            TextFormField(
                              controller: nameController,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText:
                                    get_admin_details.data.name.toString(),
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              get_admin_details.data.email.toString(),
                              style: TextStyle(
                                  color: Colors.grey, fontSize: 14.sp),
                            ),
                            SizedBox(
                              height: 18.h,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 5.h,
                                  width: 35.w,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Admin_Home_Page()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: appThemeColor2,
                                      side: BorderSide.none,
                                      shape: const StadiumBorder(),
                                    ),
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          fontSize: 16.sp, color: Colors.white),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 5.h,
                                  width: 35.w,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await Admin_Update_profile_data_controller()
                                          .Admin_Update_profile_data_controller_method(
                                              nameController.text,
                                              context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: appThemeColor3,
                                      side: BorderSide.none,
                                      shape: const StadiumBorder(),
                                    ),
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontSize: 16.sp, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Future get_admin_details_data() async {
    get_admin_details = await get_admin_details_controller()
        .get_admin_details_controller_method();
    print(get_admin_details);
    if (get_admin_details.status.toString() == "200") {
      setState(() {
        is_load_admin_details = true;
      });
    }
  }
}
