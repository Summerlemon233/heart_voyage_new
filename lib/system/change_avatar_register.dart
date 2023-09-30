import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './common_image.dart';
import './login.dart';
import './userdata.dart';
import './userdata_func.dart';
import 'change_avatar.dart';

class change_avatar_register extends StatefulWidget {
  @override
  _change_avatar_registerState createState() => _change_avatar_registerState();
}

class _change_avatar_registerState extends State<change_avatar_register> {
  late bool _isSelectedAvatar;

  @override
  void initState() {
    readPhotoPath_avatar();
    _isSelectedAvatar = (PhotoPath_avatar.isNotEmpty);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        //title: Text('关于心协'),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text('上传头像'),
            IconButton(
                onPressed: () {
                  setState(() {
                    loadBasicData();
                    readPhotoPath_avatar();
                  });
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Container(height: 20),
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Obx(
                () => PhotoPath_avatar.isNotEmpty
                    ? Avatar(image: imageFromFile(PhotoPath_avatar[0]).image)
                    : Avatar(image: AssetImage('assets/images/not_login.png')),
              ),
              //Obx(() =>

              //),
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Center(
              child: Text(
                "${basicData["username"]}",
                style:
                    const TextStyle(fontSize: 30, fontFamily: 'Helvetica_Neue'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            /*const Center(
              child: Text(
                "点击刷新键看看自己更换的头像吧",
                style: TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Obx(() => PhotoPath_avatar.isEmpty?Text('empty'):Text(PhotoPath_avatar.first),),*/

            Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.25,
                    10,
                    MediaQuery.of(context).size.width * 0.25,
                    10),
                child: Obx(
                  () => PhotoPath_avatar.isEmpty
                      ? ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 255, 189, 177),
                              ),
                              // 设置圆角
                              shape: MaterialStateProperty.all(
                                  const StadiumBorder(
                                      side: BorderSide(
                                          style: BorderStyle.none)))),
                          onPressed: () {
                            setState(() {
                              selectPhoto_avatar(context);
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.add_a_photo),
                              Text(
                                "更换头像",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .headlineSmall,
                              ),
                            ],
                          ))
                      : ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 255, 189, 177),
                              ),
                              // 设置圆角
                              shape: MaterialStateProperty.all(
                                  const StadiumBorder(
                                      side: BorderSide(
                                          style: BorderStyle.none)))),
                          onPressed: () {
                            setState(() {
                              saveBasicData();
                              Get.snackbar('提示', '注册成功！即将返回登录页面。');
                              Future.delayed(const Duration(seconds: 2), () {
                                Get.offAll(const login());
                              });
                            });
                          },
                          child: Text(
                            "去登录",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headlineSmall,
                          )),
                )),
        Container(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.width * 0.25,
              10,
              MediaQuery.of(context).size.width * 0.25,
              10),
          child: Center(
            child: ElevatedButton(
                style: ButtonStyle(
                    foregroundColor:
                    MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 255, 189, 177),
                    ),
                    // 设置圆角
                    shape: MaterialStateProperty.all(
                        const StadiumBorder(
                            side: BorderSide(
                                style: BorderStyle.none)))),
                onPressed: () {
                  setState(() {
                    Get.snackbar('提示', '注册成功！即将返回登录页面。');
                    Future.delayed(const Duration(seconds: 2), () {
                      Get.offAll(const login());
                    });
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.skip_next),
                    Text(
                      "跳过",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headlineSmall,
                    ),
                  ],
                )),
          ),
        ),


            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
