import 'package:cmp_app/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserScreen();
}

class _UserScreen extends State<UserScreen> {
  String? userFullName = '';
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();

    setState(() {
      userFullName = user!.displayName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text('Bienvenido ' + (userFullName ?? '')),
    ));
  }
}
