import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import '../constants/color_constants.dart';

Widget Splash_screen_background_image() {
  return Container(
    height: 40.h,
    width: 80.w,
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: AssetImage(
              "assets/images/6f63b7bde90fb63ce05acab9f55fad4a-removebg-preview.png"),
          fit: BoxFit.cover),
    ),
  );
}

Widget BackGround_Images() {
  return SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 30.h,
          width: 100.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/indian_flag h.jpg"),
                opacity: 0.4,
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          height: 35.h,
        ),
        Container(
          height: 30.h,
          width: 100.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/indian_flag f.jpg"),
                opacity: 0.4,
                fit: BoxFit.cover),
          ),
        ),
      ],
    ),
  );
}

Widget textFieldContainer(controller, context, text, icons) {
  return TextFormField(
    onChanged: (value) {
      // setState(() {
      //   textValue = value;
      // });
    },
    onTap: () {},
    controller: controller,
    cursorColor: appThemeColor,
    decoration: InputDecoration(
      suffixIcon: Icon(icons, color: appThemeColor),
      hintText: text,
      hintStyle: TextStyle(fontSize: 14.sp, color: appThemeColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appThemeColor, width: 0.5.w),
        borderRadius: BorderRadius.circular(30),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}

Widget openProfilePhoto(context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
    elevation: 0.0,
    backgroundColor: Colors.transparent,
    child: Stack(
      children: [
        CircleAvatar(
          radius: 20.h,
          backgroundImage: const AssetImage('assets/images/3135715.png'),
        ),
        Positioned(
          right: 2.h,
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
  );
}

Future customFlutterToast(msg) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: appThemeColor2,
    textColor: Colors.white,
    fontSize: 16.sp,
  );
}

Widget edit_Profile_Page_Container() {
  return Column(
    children: [
      Container(
        height: 20.h,
        width: double.infinity,
        color: appThemeColor,
      ),
      Container(
        color: Colors.white,
        height: 10.h,
        width: double.infinity,
      ),
    ],
  );
}

Widget cardTaskDetails(){
  return SizedBox(
    width: 100.w,
    child: Card(

      color: Colors.white70,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "Flutter is an open-source UI software"
              " development kit created by Google. It is used to develop cross platform applications from a single codebase for any web",
          style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black54),
        ),
      ),
    ),
  );
}