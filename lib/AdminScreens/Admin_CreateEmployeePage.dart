import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:taskmanagerapp/constants/color_constants.dart';
import 'package:taskmanagerapp/controller/Create_user_controller.dart';
import '../controller/Get_Assignee_Controller.dart';
import '../model/get_Assignee_Data_model.dart';
import 'Admin_Home_Page.dart';

class Admin_CreateEmployeePage extends StatefulWidget {
  const Admin_CreateEmployeePage({super.key});

  @override
  State<Admin_CreateEmployeePage> createState() =>
      _Admin_CreateEmployeePageState();
}

class _Admin_CreateEmployeePageState extends State<Admin_CreateEmployeePage> {
  TextEditingController createUserName = TextEditingController();
  TextEditingController createUserPassword = TextEditingController();
  TextEditingController createUserConfirmPassword = TextEditingController();
  TextEditingController createUserPhnNo = TextEditingController();
  TextEditingController createUserEmail = TextEditingController();
  TextEditingController createUserFirstName = TextEditingController();
  TextEditingController createUserLastName = TextEditingController();
  TextEditingController createUserGender = TextEditingController();
  TextEditingController createUserDob = TextEditingController();
  TextEditingController createUserAddress = TextEditingController();
  late GetAssigneDataModel fetch_data;
  bool is_loading = false;

  @override
  void initState() {
    super.initState();
    fetch_emp_destails();
  }
  @override
  void dispose() {
    super.dispose();
    createUserName.dispose();
    createUserPassword.dispose();
    createUserConfirmPassword.dispose();
    createUserPhnNo.dispose();
    createUserEmail.dispose();
    createUserFirstName.dispose();
    createUserLastName.dispose();
    createUserGender.dispose();
    createUserDob.dispose();
    createUserAddress.dispose();
  }
  Widget _listItem(index) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black26))),
      child: ListTile(
        leading: Text(fetch_data.data![index].id.toString(),
            style: const TextStyle(fontSize: 18)),
        title: Text(
          fetch_data.data[index].firstName.toString(),
          style: const TextStyle(fontSize: 18),
        ),
        trailing: Text(fetch_data.data![index].phone.toString(),
            style: const TextStyle(
              fontSize: 18,
            )),
      ),
    );
  }

  Widget createEmployeeForm() {
    return Dialog(
        child: Container(
      height: 600.h,
      child: Stack(
        // alignment: Alignment.topRight,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Column(
                children: [
                  Container(
                      height: 5.h,
                      width: double.infinity,
                      color: appThemeColor,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          Text(
                            "Login Details",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                    child: Column(
                      children: [
                        TextFormField(
                          onTap: () {},
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: appThemeColor,
                            ),
                            label: Text(
                              "Username",
                              style: TextStyle(
                                color: appThemeColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: appThemeColor, width: 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          controller: createUserName,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          onTap: () {},
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock, color: appThemeColor),
                            label: Text(
                              "Password",
                              style: TextStyle(
                                color: appThemeColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: appThemeColor, width: 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          controller: createUserPassword,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          onTap: () {},
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: appThemeColor,
                            ),
                            label: Text(
                              "Confirm Password",
                              style: TextStyle(
                                color: appThemeColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: appThemeColor, width: 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          controller: createUserConfirmPassword,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          onTap: () {},
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            counterText: "",
                            prefixIcon: Icon(Icons.call, color: appThemeColor),
                            label: Text(
                              "+91",
                              style: TextStyle(
                                color: appThemeColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: appThemeColor, width: 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          controller: createUserPhnNo,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          onTap: () {},
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.mail_rounded, color: appThemeColor),
                            label: Text(
                              "Email",
                              style: TextStyle(color: appThemeColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: appThemeColor, width: 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          controller: createUserEmail,
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 5.h,
                      width: double.infinity,
                      color: appThemeColor,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          Text(
                            "Personal Details",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
                    child: Column(
                      children: [
                        TextFormField(
                          onTap: () {},
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.person, color: appThemeColor),
                            label: Text(
                              "First Name",
                              style: TextStyle(
                                color: appThemeColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: appThemeColor, width: 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          controller: createUserFirstName,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          onTap: () {},
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.person, color: appThemeColor),
                            label: Text(
                              "Last Name",
                              style: TextStyle(
                                color: appThemeColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: appThemeColor, width: 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          controller: createUserLastName,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          onTap: () {},
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.girl,
                              color: appThemeColor,
                            ),
                            label: Text(
                              "Gender",
                              style: TextStyle(
                                color: appThemeColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: appThemeColor, width: 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          controller: createUserGender,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        TextFormField(
                          controller: createUserDob,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: appThemeColor, width: 0.5.w),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: 'YYYY-MM-DD',
                            prefixIcon: InkWell(
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
                                    createUserDob.text =
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
                          height: 1.h,
                        ),
                        TextFormField(
                          onTap: () {},
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_city_outlined,
                                color: appThemeColor),
                            label: Text(
                              "Address",
                              style: TextStyle(
                                color: appThemeColor,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: appThemeColor, width: 0.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          controller: createUserAddress,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                    width: 30.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          appThemeColor3,
                        ),
                      ),
                      onPressed: () {
                        Create_User_Controller()
                            .create_user_controller_method(
                                context,
                                createUserName.text,
                                createUserPassword.text,
                                createUserConfirmPassword.text,
                                createUserPhnNo.text,
                                createUserEmail.text,
                                createUserFirstName.text,
                                createUserLastName.text,
                                createUserGender.text,
                                createUserDob.text,
                                createUserAddress.text)
                            .whenComplete(() => clearControllersData());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.note_add_outlined),
                          Text(
                            "Create",
                            style: TextStyle(fontSize: 14.sp),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 1.w,
            top: 0.5.h,
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
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Employee"),
        backgroundColor: appThemeColor,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Admin_Home_Page(),
                ),
              );
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        elevation: 15,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return createEmployeeForm();
                  },
                );
              },
              child: Column(
                children: [
                  Icon(
                    Icons.person_add_alt_1,
                    color: appThemeColor2,
                  ),
                  Text(
                    "Create new",
                    style: TextStyle(color: appThemeColor2),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      body: is_loading
          ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      height: 10.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: appThemeColor3),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              fetch_data.countOfEmp.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.sp),
                            ),
                            Text(
                              "Total Employee",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.h),
                    color: appThemeColor,
                    child: ListTile(
                      leading: Text(
                        'Id',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 22,
                          color: appThemeColor2,
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(
                            'Name',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 22,
                                color: appThemeColor2),
                          ),
                        ],
                      ),
                      trailing: Text(
                        'Mobile No.',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 22,
                            color: appThemeColor2),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, index) {
                        return _listItem(index);
                      },
                      itemCount: fetch_data.data!.length,
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  clearControllersData() {
    createUserName.clear();
    createUserAddress.clear();
    createUserConfirmPassword.clear();
    createUserDob.clear();
    createUserEmail.clear();
    createUserFirstName.clear();
    createUserGender.clear();
    createUserLastName.clear();
    createUserPhnNo.clear();
    createUserPassword.clear();
  }

  void fetch_emp_destails() async {
    fetch_data = await get_assignee_controller().get_assignee_controller_method();
    if (fetch_data.status.toString() == "200") {
      setState(() {
        is_loading = true;
      });
    }
  }
}
