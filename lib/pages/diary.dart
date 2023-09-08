import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_voyage_new/diary/new_diary.dart';

class diary extends StatefulWidget {
  const diary({super.key});

  @override
  State<diary> createState() => _diaryState();
}

class _diaryState extends State<diary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('日记'),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: () {
          setState(() {
            Get.to(new_diary());
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
