import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_voyage_new/meditation/XINXIE.dart';
import 'package:heart_voyage_new/meditation/ZHENGNIAN.dart';
import 'package:heart_voyage_new/meditation/practice.dart';
import 'package:heart_voyage_new/system/common_widgets.dart';

class meditation extends StatefulWidget {
  const meditation({super.key});

  @override
  State<meditation> createState() => _meditationState();
}

class _meditationState extends State<meditation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('冥想'),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(7,5, 7, 10),
          child: ListView(
            children: [
              SizedBox(height: 20),
              funcCard(Area: '正念', AssetPath: 'assets/images/sit_album.jpeg', onTapFunc: (){
                setState(() {
                  Get.to(ZHENGNIAN());
                });
              }, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
