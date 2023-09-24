import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_voyage_new/system/common_widgets.dart';
import 'package:heart_voyage_new/system/userdata.dart';

import '../system/common_image.dart';
import '../system/userdata_func.dart';

class my_diary extends StatefulWidget {
  const my_diary({super.key});

  @override
  State<my_diary> createState() => _my_diaryState();
}

class _my_diaryState extends State<my_diary> {
  @override
  void initState() {
// You can can also directly ask the permission about its status.

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      //backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('我的全部日记'),
            IconButton(
                onPressed: () {
                  setState(() {
                    init_data();
                  });
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          child: photoPath_diary.value.isEmpty
              ? Center(
                  child: TextButton(
                      onPressed: () {
                        setState(() {
                          init_data();
                        });
                      },
                      child: Text('点击以加载我的全部笔记')))
              : ListView.builder(
                  reverse: true,
                  itemCount: basicData['note_case'],
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(() => myDiaryCard(
                        AssetPath: photoPath_diary[index],
                        onTapFunc: () {},
                        //AvatarPath: showData[0]['avatarPath'],
                        //userName: basicData['username'],
                        title: basicData['title_mood'][index],
                        releaseTime: basicData['date_mood'][index],
                        textContent: basicData['context_mood'][index],
                        location: basicData['location'][index],
                        province: basicData['province'][index],
                        likes: 0));
                  }),
        ),
      ),
    );
  }
}
