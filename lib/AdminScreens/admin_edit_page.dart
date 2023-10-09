import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/AdminScreens/Admin_Profile_Page.dart';
import 'package:taskmanagerapp/controller/get_Admin_Details_controller.dart';
import '../constants/Pref_constants.dart';
import '../constants/color_constants.dart';
import '../controller/Admin_update_profile_data_controller.dart';
import '../model/get_Admin_details_model.dart';
import 'Admin_Home_Page.dart';

class Admin_edit_page extends StatefulWidget {
  const Admin_edit_page({Key? key}) : super(key: key);

  @override
  State<Admin_edit_page> createState() => _Admin_edit_pageState();
}

class _Admin_edit_pageState extends State<Admin_edit_page> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController professionController = TextEditingController();
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
    firstnameController.dispose();
    lastnameController.dispose();
    mobileController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    countryController.dispose();
    dobController.dispose();
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
                            controller: firstnameController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText:
                                  get_admin_details.data?.firstName.toString(),
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
                            controller: lastnameController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              hintText:
                                  get_admin_details.data?.lastName.toString(),
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
                            "priyasriofficial@gmail.com",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
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
                            onTap: () {},
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              counterText: "",
                              hintText:
                                  "+91 ${get_admin_details.data?.phone.toString()}",
                            ),
                            controller: mobileController,
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
                            decoration: InputDecoration(
                              hintText:
                                  get_admin_details.data?.address.toString(),
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
                            decoration: InputDecoration(
                              hintText: get_admin_details.data?.city.toString(),
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
                            decoration: InputDecoration(
                              hintText:
                                  get_admin_details.data?.state.toString(),
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
                            decoration: InputDecoration(
                              hintText:
                                  get_admin_details.data?.zipCode.toString(),
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
                            decoration: InputDecoration(
                              hintText:
                                  get_admin_details.data?.country.toString(),
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
                            controller: dobController,
                            decoration: InputDecoration(
                              hintText: get_admin_details.data?.dob.toString().substring(0,10),
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
                                      dobController.text =
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
                            decoration: InputDecoration(
                              hintText:
                                  get_admin_details.data?.profession.toString(),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Admin_Home_Page()),
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
                                            firstnameController.text,
                                            lastnameController.text,
                                            mobileController.text,
                                            addressController.text,
                                            cityController.text,
                                            stateController.text,
                                            zipController.text,
                                            countryController.text,
                                            dobController.text,
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
              ))
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }

  Future get_admin_details_data() async {
    get_admin_details = await get_admin_details_controller()
        .get_admin_details_controller_method();
    print(get_admin_details);
    if(get_admin_details.status.toString() == "200"){
      setState(() {
        is_load_admin_details = true;
      });
    }
  }
}
