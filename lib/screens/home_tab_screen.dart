import 'package:flutter/material.dart';

class HomeTabScreen extends StatefulWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeTabScreen();
}

class _HomeTabScreen extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Centro Misionero\nPentecostés',
        style: TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      ),
    );
  }
}
