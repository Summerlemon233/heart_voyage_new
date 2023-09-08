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
    _isSelectedAvatar = !(PhotoPath_avatar[0] == "");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
        //backgroundColor: Color.fromRGBO(45, 73, 104, 1),
        //foregroundColor: Colors.white,
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
            Container(
              height: MediaQuery.of(context).size.width * 0.5,
              width: MediaQuery.of(context).size.width * 0.5,
              child: selectedAsset_avatar != null
                  ? Avatar(image: imageFromFile(PhotoPath_avatar[0]).image)
                  : const Avatar(image: AssetImage('assets/images/pet0.png')),
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Center(
              child: Text(
                "${basicData["username"]}",
                style: const TextStyle(fontSize: 30, fontFamily: 'Helvetica_Neue'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Center(
              child: Text(
                "点击刷新键看看自己更换的头像吧",
                style: TextStyle(fontSize: 15, ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0.25,
                  10,
                  MediaQuery.of(context).size.width * 0.25,
                  10),
              child: selectedAsset_avatar == null
                  ? ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(45, 73, 104, 1),
                          ),
                          // 设置圆角
                          shape: MaterialStateProperty.all(const StadiumBorder(
                              side: BorderSide(style: BorderStyle.none)))),
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
                            const Color.fromRGBO(45, 73, 104, 1),
                          ),
                          // 设置圆角
                          shape: MaterialStateProperty.all(const StadiumBorder(
                              side: BorderSide(style: BorderStyle.none)))),
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
                        style: Theme.of(context).primaryTextTheme.headlineSmall,
                      )),
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
