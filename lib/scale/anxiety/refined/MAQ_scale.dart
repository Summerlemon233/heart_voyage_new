import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MAQ_scale extends StatefulWidget {
  const MAQ_scale({Key? key}) : super(key: key);

  @override
  State<MAQ_scale> createState() => _MAQ_scaleState();
}

class _MAQ_scaleState extends State<MAQ_scale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(45, 73, 104, 1),
          foregroundColor: Colors.white,title: Text('MAQ量表')),
      body: SafeArea(
        child: Text("敬请期待"),
      ),
    );;
  }
}
