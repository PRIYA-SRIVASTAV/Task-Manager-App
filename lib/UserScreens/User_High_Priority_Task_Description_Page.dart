import 'package:flutter/material.dart';
class UserHighPriorityTaskDescriptionPage extends StatefulWidget {
  const UserHighPriorityTaskDescriptionPage({super.key});

  @override
  State<UserHighPriorityTaskDescriptionPage> createState() => _UserHighPriorityTaskDescriptionPageState();
}

class _UserHighPriorityTaskDescriptionPageState extends State<UserHighPriorityTaskDescriptionPage> {
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
