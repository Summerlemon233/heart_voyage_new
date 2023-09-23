import 'package:flutter/material.dart';
import 'package:get/get.dart';

class anxiety_influence extends StatefulWidget {
  const anxiety_influence({Key? key}) : super(key: key);

  @override
  State<anxiety_influence> createState() => _anxiety_influenceState();
}

class _anxiety_influenceState extends State<anxiety_influence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(45, 73, 104, 1),
          foregroundColor: Colors.white,title: Text('焦虑的影响')),
      body: SafeArea(
        child: Text("敬请期待"),
      ),
    );
  }
}
