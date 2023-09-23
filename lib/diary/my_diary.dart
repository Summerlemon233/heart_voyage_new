import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heart_voyage_new/diary/new_diary.dart';
import 'package:heart_voyage_new/system/common_widgets.dart';
import 'package:heart_voyage_new/system/userdata.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import '../system/common_image.dart';
import '../system/showdata.dart';

class my_diary extends StatefulWidget {
  const my_diary({super.key});

  @override
  State<my_diary> createState() => _my_diaryState();
}

class _my_diaryState extends State<my_diary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      //backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
        //backgroundColor: Color.fromRGBO(45, 73, 104, 1),
        //foregroundColor: Colors.white,
        title: Text('我的所有日记'),
      ),
      body: SafeArea(
        child: Container(
          child: new ListView.builder(
              itemCount: basicData['note_case'],
              itemBuilder: (BuildContext context, int index) {
                return new myDiaryCard(
                    AssetPath: photoPath_diary[index],
                    onTapFunc: (){},
                    //AvatarPath: showData[0]['avatarPath'],
                    //userName: basicData['username'],
                    releaseTime: basicData['date_mood'][index],
                    textContent: basicData['context_mood'][index],
                    location: basicData['location'][index],
                    province: basicData['province'][index],
                    likes: 0);
              }),
        ),
      ),
    );
  }
}
