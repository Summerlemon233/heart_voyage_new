import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_voyage_new/diary/my_diary.dart';
import 'package:heart_voyage_new/diary/new_diary.dart';
import 'package:heart_voyage_new/system/common_image.dart';
import 'package:heart_voyage_new/system/common_widgets.dart';
import 'package:permission_handler/permission_handler.dart';

import '../diary/diary_type_select.dart';
import '../system/showdata.dart';
import '../system/userdata.dart';
import '../system/userdata_func.dart';

class diary extends StatefulWidget {
  const diary({super.key});

  @override
  State<diary> createState() => _diaryState();
}

class _diaryState extends State<diary> {
  List<Widget> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('日记'),
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
        child: ListView(
          children: [
            /*Obx(() => Text('$basicData')),
            Obx(() => Text('${photoPath_diary.value}')),*/
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.book),
                        Text(
                          "最近添加的日记",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*Container(
                    alignment: Alignment.center,
                    height: 50,
                    //width: 100,
                    margin: EdgeInsets.fromLTRB(
                        20, 3, 0, 6),
                    child:

                    decoration: BoxDecoration(
                      color: Colors.purple[50],
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),*/
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        Map<Permission, PermissionStatus> statuses = await [
                          Permission.storage,
                          Permission.photos,
                          //Permission.manageExternalStorage,
                          Permission.mediaLibrary,
                        ].request();
                        if (await Permission.storage.isPermanentlyDenied) {
                          Get.dialog(Column(
                            children: [
                              Text('storage'),
                              ElevatedButton(onPressed: (){
                                openAppSettings();
                              }, child: Text(
                                  '前往设置页面打开权限'
                              ))
                            ],
                          ),);
                          print('storageDenied');

                        }
                        else if (await Permission.photos.isDenied) {
                          print('photoDenied');
                          Get.dialog(Column(
                            children: [
                              Text('photo'),
                              ElevatedButton(onPressed: (){
                                openAppSettings();
                              }, child: Text(
                                  '前往设置页面打开权限'
                              ))
                            ],
                          ),);
                        }
                        /*if (await Permission.manageExternalStorage.isDenied) {
            print('externalStorageDenied');
              openAppSettings();
            }*/
                        else if (await Permission.mediaLibrary.isDenied) {
                          Get.dialog(Column(
                            children: [
                              Text('mediaLib'),
                              ElevatedButton(onPressed: (){
                                openAppSettings();
                              }, child: Text(
                                  '前往设置页面打开权限'
                              ))
                            ],
                          ),);
                          print('mediaLibDenied_ios');
                          openAppSettings();
                        }
                        else Get.to(diary_type_select());
                      },
                      child: Icon(Icons.add)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            funcCard(
                color: Colors.black,
                Area: '我的所有日记',
                AssetPath: 'assets/images/notes.jpg',
                onTapFunc: () async {
                  /*Map<Permission, PermissionStatus> statuses = await [
                    Permission.storage,
                    Permission.photos,
                    Permission.manageExternalStorage,
                    Permission.mediaLibrary,
                  ].request();
                  if (await Permission.storage.isDenied) {
                    openAppSettings();
                  }
                  if (await Permission.photos.isDenied) {
                    openAppSettings();
                  }
                  if (await Permission.manageExternalStorage.isDenied) {
                    openAppSettings();
                  }
                  if (await Permission.mediaLibrary.isDenied) {
                    openAppSettings();
                  }*/


                  setState(() {
                    readPhotoPath_mood();
                    Get.to(my_diary());
                  });
                }),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text("您还没有撰写过日记。不妨试试吧~"),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.book),
                        Text(
                          "发现",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  /*Container(
                    alignment: Alignment.center,
                    height: 50,
                    //width: 100,
                    margin: EdgeInsets.fromLTRB(
                        20, 3, 0, 6),
                    child:

                    decoration: BoxDecoration(
                      color: Colors.purple[50],
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),*/
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(onPressed: () {}, child: Icon(Icons.refresh)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            momentCard(
                AssetPath: showData[0]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[0]['photoAssetPath'],
                userName: showData[0]['userId'],
                releaseTime: showData[0]['timeSaved'],
                textContent: showData[0]['description'],
                location: locationList[0],
                province: ProvinceList[0],
                likes: 3),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[1]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[1]['photoAssetPath'],
                userName: showData[1]['userId'],
                releaseTime: showData[1]['timeSaved'],
                textContent: showData[1]['description'],
                location: locationList[1],
                province: ProvinceList[1],
                likes: 3),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[2]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[2]['photoAssetPath'],
                userName: showData[2]['userId'],
                releaseTime: showData[2]['timeSaved'],
                textContent: showData[2]['description'],
                location: locationList[2],
                province: ProvinceList[2],
                likes: 11),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[3]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[3]['photoAssetPath'],
                userName: showData[3]['userId'],
                releaseTime: showData[3]['timeSaved'],
                textContent: showData[3]['description'],
                location: locationList[3],
                province: ProvinceList[3],
                likes: 3),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[4]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[4]['photoAssetPath'],
                userName: showData[4]['userId'],
                releaseTime: showData[4]['timeSaved'],
                textContent: showData[4]['description'],
                location: locationList[4],
                province: ProvinceList[4],
                likes: 4),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[5]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[5]['photoAssetPath'],
                userName: showData[5]['userId'],
                releaseTime: showData[5]['timeSaved'],
                textContent: showData[5]['description'],
                location: locationList[5],
                province: ProvinceList[5],
                likes: 5),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[6]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[6]['photoAssetPath'],
                userName: showData[6]['userId'],
                releaseTime: showData[6]['timeSaved'],
                textContent: showData[6]['description'],
                location: locationList[6],
                province: ProvinceList[6],
                likes: 6),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[7]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[7]['photoAssetPath'],
                userName: showData[7]['userId'],
                releaseTime: showData[7]['timeSaved'],
                textContent: showData[7]['description'],
                location: locationList[7],
                province: ProvinceList[7],
                likes: 7),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[8]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[8]['photoAssetPath'],
                userName: showData[8]['userId'],
                releaseTime: showData[8]['timeSaved'],
                textContent: showData[8]['description'],
                location: locationList[8],
                province: ProvinceList[8],
                likes: 8),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[9]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[9]['photoAssetPath'],
                userName: showData[9]['userId'],
                releaseTime: showData[9]['timeSaved'],
                textContent: showData[9]['description'],
                location: locationList[9],
                province: ProvinceList[9],
                likes: 9),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[10]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[10]['photoAssetPath'],
                userName: showData[10]['userId'],
                releaseTime: showData[10]['timeSaved'],
                textContent: showData[10]['description'],
                location: locationList[10],
                province: ProvinceList[10],
                likes: 10),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[11]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[11]['photoAssetPath'],
                userName: showData[11]['userId'],
                releaseTime: showData[11]['timeSaved'],
                textContent: showData[11]['description'],
                location: locationList[11],
                province: ProvinceList[11],
                likes: 11),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[12]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[12]['photoAssetPath'],
                userName: showData[12]['userId'],
                releaseTime: showData[12]['timeSaved'],
                textContent: showData[12]['description'],
                location: locationList[12],
                province: ProvinceList[12],
                likes: 12),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[13]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[13]['photoAssetPath'],
                userName: showData[13]['userId'],
                releaseTime: showData[13]['timeSaved'],
                textContent: showData[13]['description'],
                location: locationList[13],
                province: ProvinceList[13],
                likes: 13),
            SizedBox(height: 10),
            momentCard(
                AssetPath: showData[14]['avatarPath'],
                onTapFunc: () {},
                AvatarPath: showData[14]['photoAssetPath'],
                userName: showData[14]['userId'],
                releaseTime: showData[14]['timeSaved'],
                textContent: showData[14]['description'],
                location: locationList[14],
                province: ProvinceList[14],
                likes: 14),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: () {
          (() async {
            Map<Permission, PermissionStatus> statuses = await [
              Permission.storage,
              Permission.photos,
              //Permission.manageExternalStorage,
              Permission.mediaLibrary,
            ].request();
            if (await Permission.storage.isDenied) {
              Get.dialog(Column(
                children: [
                  Text('storage'),
                  ElevatedButton(onPressed: (){
                    openAppSettings();
                  }, child: Text(
                    '前往设置页面打开权限'
                  ))
                ],
              ),);
              print('storageDenied');

            }
            else if (await Permission.photos.isDenied) {
            print('photoDenied');
            Get.dialog(Column(
              children: [
                Text('photo'),
                ElevatedButton(onPressed: (){
                  openAppSettings();
                }, child: Text(
                    '前往设置页面打开权限'
                ))
              ],
            ),);
            }
            /*if (await Permission.manageExternalStorage.isDenied) {
            print('externalStorageDenied');
              openAppSettings();
            }*/
            else if (await Permission.mediaLibrary.isDenied) {
              Get.dialog(Column(
                children: [
                  Text('mediaLib'),
                  ElevatedButton(onPressed: (){
                    openAppSettings();
                  }, child: Text(
                      '前往设置页面打开权限'
                  ))
                ],
              ),);
              print('mediaLibDenied_ios');
              openAppSettings();
            }
            else Get.to(diary_type_select());
            print(statuses[Permission.storage]);
            print(statuses[Permission.photos]);
            print(statuses[Permission.manageExternalStorage]);
            print(statuses[Permission.mediaLibrary]);

          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
