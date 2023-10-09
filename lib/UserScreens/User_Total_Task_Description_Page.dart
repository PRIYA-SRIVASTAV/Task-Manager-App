import 'package:flutter/material.dart';
class UserTotalTaskDescriptionPage extends StatefulWidget {
  const UserTotalTaskDescriptionPage({super.key});

  @override
  State<UserTotalTaskDescriptionPage> createState() => _UserTotalTaskDescriptionPageState();
}

class _UserTotalTaskDescriptionPageState extends State<UserTotalTaskDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
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
