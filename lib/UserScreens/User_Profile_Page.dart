import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../common_screens/welcome_page.dart';
import '../constants/color_constants.dart';
import '../controller/get_User_Details_controller.dart';
import '../model/get_User_details_model.dart';
import '../utils/helper_widgets.dart';
import 'User_edit_Page.dart';

class User_ProfilePage extends StatefulWidget {
  const User_ProfilePage({super.key});

  @override
  State<User_ProfilePage> createState() => _User_ProfilePageState();
}

class _User_ProfilePageState extends State<User_ProfilePage> {
  late GetUserDetailsModel get_user_details;
  bool is_load_get_user_detail = false;

  @override
  void initState() {
    super.initState();
    get_user_details_method();
  }

  File? profileImage;

  Future getProfileImage(ImageSource source) async {
    try {
      final profileImage = await ImagePicker().pickImage(source: source);
      if (profileImage == null) return;

      final profileImageTemporary = File(profileImage.path);

      setState(() {
        this.profileImage = profileImageTemporary;
      });
    } catch (e) {
      print("Failed to pick image : $e");
    }
  }

  Widget imageWidget() {
    return profileImage == null
        ? Container(
            height: 20.h,
            width: 20.w,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/3135715.png"),
              ),
            ),
          )
        : Container(
            height: 20.h,
            width: 20.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                profileImage!,
                fit: BoxFit.cover,
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Profile"),
        backgroundColor: appThemeColor,
        leading: const Icon(Icons.person),
        elevation: 15,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 40.w,
                    child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return openProfilePhoto(context);
                            },
                          );
                        },
                        child: imageWidget()),
                  ),
                  Positioned(
                    bottom: 1.h,
                    right: 1.w,
                    child: InkWell(
                      onTap: () {
                        getProfileImage(ImageSource.gallery);
                      },
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: appThemeColor,
                        size: 26.sp,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "${get_user_details.data!.firstName.toString()} ${get_user_details.data!.lastName.toString()}",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                "${get_user_details.data!.email.toString()}",
                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              SizedBox(
                width: 30.w,
                height: 5.h,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const edit_Page(),
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
                  ),
                ),
              ),
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
                onTap: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
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
                  child: Icon(
                    Icons.logout,
                    color: appThemeColor2,
                  ),
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
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: appThemeColor2,
                  ),
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
                  child: Icon(
                    Icons.settings_suggest_outlined,
                    color: appThemeColor2,
                  ),
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
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: appThemeColor2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void get_user_details_method() async {
    get_user_details = await get_user_details_controller()
        .get_user_details_controller_method();
    if (get_user_details.status.toString() == "200") {
      setState(() {
        is_load_get_user_detail = true;
      });
    }
  }
}
