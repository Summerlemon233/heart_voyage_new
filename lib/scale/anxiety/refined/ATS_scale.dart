import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../overall_judge.dart';




class ATS_scale extends StatefulWidget {
  const ATS_scale({Key? key}) : super(key: key);

  @override
  State<ATS_scale> createState() => _ATS_scaleState();
}

class _ATS_scaleState extends State<ATS_scale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(45, 73, 104, 1),
          foregroundColor: Colors.white,title: Text('ATS量表')),
      body: SafeArea(
        child: Text("敬请期待"),
      ),
    );
  }
}
