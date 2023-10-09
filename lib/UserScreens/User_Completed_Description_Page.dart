import 'package:flutter/material.dart';
class UserCompletedDescriptionPage extends StatefulWidget {
  const UserCompletedDescriptionPage({super.key});

  @override
  State<UserCompletedDescriptionPage> createState() => _UserCompletedDescriptionPageState();
}

class _UserCompletedDescriptionPageState extends State<UserCompletedDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey,
          height: 20,
          width: 20,
        ),
      ),
    ));
  }
}
