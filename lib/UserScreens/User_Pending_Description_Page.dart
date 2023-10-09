import 'package:flutter/material.dart';
class UserPendingDescriptionPage extends StatefulWidget {
  const UserPendingDescriptionPage({super.key});

  @override
  State<UserPendingDescriptionPage> createState() => _UserPendingDescriptionPageState();
}

class _UserPendingDescriptionPageState extends State<UserPendingDescriptionPage> {
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
