import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/UserScreens/User_HomePage.dart';
import 'package:taskmanagerapp/controller/get_User_Details_controller.dart';
import '../constants/Pref_constants.dart';
import '../constants/color_constants.dart';
import '../controller/User_update_profile_controller.dart';
import '../model/get_User_details_model.dart';
import '../utils/helper_methods.dart';

class edit_Page extends StatefulWidget {
  const edit_Page({super.key});

  @override
  State<edit_Page> createState() => _edit_PageState();
}

class _edit_PageState extends State<edit_Page> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNamecontroller = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController DOBController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  late GetUserDetailsModel get_user_details;
  bool is_load_get_user_detail = false;

  @override
  void initState() {
    super.initState();
    get_user_details_method();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    firstNameController.dispose();
    lastNamecontroller.dispose();
    mobileController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    countryController.dispose();
    DOBController.dispose();
    professionController.dispose();
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
                  builder: (context) => const User_HomePageScreen(),
                ),
              );
            },
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body:is_load_get_user_detail ? SingleChildScrollView(
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
                        "1. Contact Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: appThemeColor),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "First Name",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFormField(
                        controller: firstNameController,
                        decoration:  InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: get_user_details.data?.firstName.toString(),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Last Name",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFormField(
                        controller: lastNamecontroller,
                        decoration:  InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: get_user_details.data?.lastName.toString(),
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
                      Text("${get_user_details.data?.email.toString()}",
                        style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 3.h,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Mobile No.",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFormField(
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration:  InputDecoration(
                          counterText: "",
                          hintText: '+91 ${get_user_details.data?.phone.toString()}',
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Address:",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFormField(
                        controller: addressController,
                        decoration:  InputDecoration(
                          hintText: get_user_details.data?.address.toString(),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "City/Town:",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFormField(
                        controller: cityController,
                        decoration:  InputDecoration(
                          hintText: get_user_details.data?.city.toString(),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "State/Province:",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFormField(
                        controller: stateController,
                        decoration:  InputDecoration(
                          hintText: get_user_details.data?.state.toString(),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Zip/Postal Code:",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFormField(
                        controller: zipController,
                        decoration:  InputDecoration(
                          hintText: get_user_details.data?.zipCode.toString(),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Country:",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFormField(
                        controller: countryController,
                        decoration:  InputDecoration(
                          hintText: get_user_details.data?.country.toString(),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "2. Date Of Birth",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: appThemeColor),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Select Date of birth:",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFormField(
                        controller: DOBController,
                        decoration: InputDecoration(
                          hintText: get_user_details.data?.dob.toString().substring(0,10),
                          suffixIcon: InkWell(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2100),
                                helpText: "CHOOSE DATE OF BIRTH",
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
                                          foregroundColor:
                                              Colors.green, // button text color
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
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate);
                                setState(() {
                                  DOBController.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                            child: Icon(
                              Icons.calendar_month,
                              color: appThemeColor,
                            ),
                          ),
                          //border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "3. Your Profession ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            color: appThemeColor),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Your Profession:",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      TextFormField(
                        controller: professionController,
                        decoration:  InputDecoration(
                          hintText: get_user_details.data?.profession.toString(),
                          border: UnderlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 5.h,
                            width: 35.w,
                            child: ElevatedButton(
                              onPressed: () {
                              Navigator.pop(context);
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
                                var id;
                                await getPref().then((value) {
                                  id = value.getString(KEYID);
                                });
                                print(
                                    "==========================${id.toString()}");
                                await User_Update_profile_data_controller()
                                    .User_Update_profile_data_controller_method(
                                        id,
                                        firstNameController.text,
                                        lastNamecontroller.text,
                                        mobileController.text,
                                        addressController.text,
                                        cityController.text,
                                        stateController.text,
                                        zipController.text,
                                        countryController.text,
                                        DOBController.text,
                                        professionController.text,
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
            : Center(child: CircularProgressIndicator(),)
      ),
    );
  }

  void get_user_details_method() async {
    get_user_details = await get_user_details_controller().get_user_details_controller_method();
    if (get_user_details.status.toString() == "200") {
      setState(() {
        is_load_get_user_detail = true;
      });
    }
  }
}
