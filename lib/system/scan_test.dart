import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:flutter_easy_permission/flutter_easy_permission.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:get/get.dart';
import 'package:heart_voyage_new/pet/friend_result.dart';
import 'package:heart_voyage_new/system/friend.dart';

var permissions = const [Permissions.READ_EXTERNAL_STORAGE, Permissions.CAMERA];

var permissionGroup = const [PermissionGroup.Camera, PermissionGroup.Photos];

/*Text(
code,
maxLines: 2,
),
const SizedBox(
height: 16,
),
ElevatedButton(
child: Text("Scan Code"),
onPressed: () async {
if (!await FlutterEasyPermission.has(
perms: permissions, permsGroup: permissionGroup)) {
FlutterEasyPermission.request(
perms: permissions, permsGroup: permissionGroup);
} else {
var result = await Navigator.of(context).push(
MaterialPageRoute(builder: (BuildContext context) {
return CustomView();
}));

setState(() {
code = result ?? '';
});
}
}),*/

class CustomizedMode extends StatefulWidget {
  @override
  _CustomizedModeState createState() => _CustomizedModeState();
}

class _CustomizedModeState extends State<CustomizedMode> {
  final TextEditingController _controller = TextEditingController();
  String code = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<bool> checkInternet() async {
    late bool connectionStatus;
    try {
      String host = "google.com"; //判断国内外，谷歌还是百度
      host = "baidu.com";
      final result = await InternetAddress.lookup(host);
      print("result-- $result");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connectionStatus = true;
        print("connected $connectionStatus");
      }
    } on SocketException catch (_) {
      connectionStatus = false;
      print("not connected $connectionStatus");
    }
    return connectionStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 252, 223, 215),
        //backgroundColor: Color.fromRGBO(229, 220, 203, 1),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 189, 177),
          foregroundColor: Colors.white,
          title: Text("添加好友"),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: ListView(
              children: [
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
                            //Icon(Icons.person_add_alt_1),
                            Text(
                              "通过好友代码",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: 100,
                      ),
                      //ElevatedButton(onPressed: (){}, child: Icon(Icons.refresh)),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                TextField(
                  controller: _controller,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: '输入好友代码',
                      border: OutlineInputBorder(),
                      hintText: "不区分大小写"),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if(_controller.text.length != 5){
                        EasyLoading.showError('好友代码无效。请重新输入。');
                      }
                      else{
                        setState(() async {
                          if (await checkInternet()) {
                            EasyLoading.showSuccess('好友申请已发送。');
                          } else {
                            EasyLoading.showError('设备没有连接到互联网。请检查网络连接。');
                          }
                        });
                      }

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.add_reaction_outlined),
                        Text(
                          "发送好友申请",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    )),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            //Icon(Icons.person_add_alt_1),
                            Text(
                              "通过二维码",
                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                    ],
                  ),
                ),
                /*Text(
                  code,
                  maxLines: 2,
                ),*/
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child:  ElevatedButton(
                      child: Text("扫描二维码"),
                      onPressed: () async {
                        if (!await FlutterEasyPermission.has(
                            perms: permissions, permsGroup: permissionGroup)) {
                          FlutterEasyPermission.request(
                              perms: permissions, permsGroup: permissionGroup);
                        } else {
                          var result = await Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) {
                                return CustomView();
                              }));

                          setState(() {
                            code = result ?? '';
                            Get.to(friend_result(),arguments: code);
                          });
                        }
                      }),
                ),

              ],
            ),
          ),
        ));
  }
}

const boxSize = 200.0;

class CustomView extends StatefulWidget {
  const CustomView({Key? key}) : super(key: key);

  @override
  State<CustomView> createState() => _CustomViewState();
}

class _CustomViewState extends State<CustomView> {
  ScanKitController _controller = ScanKitController();

  @override
  void initState() {
    _controller.onResult.listen((result) {
      debugPrint(
          "scanning result:value=${result.originalValue} scanType=${result.scanType}");

      /// Note: Here the pop operation must be delayed.
      Future(() {
        Navigator.of(context).pop(result.originalValue);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    var left = screenWidth / 2 - boxSize / 2;
    var top = screenHeight / 2 - boxSize / 2;
    var rect = Rect.fromLTWH(left, top, boxSize, boxSize);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ScanKitWidget(
                controller: _controller,
                continuouslyScan: false,
                boundingBox: rect),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        _controller.switchLight();
                      },
                      icon: Icon(
                        Icons.lightbulb_outline_rounded,
                        color: Colors.white,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {
                        _controller.pickPhoto();
                      },
                      icon: Icon(
                        Icons.picture_in_picture_rounded,
                        color: Colors.white,
                        size: 28,
                      ))
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: Colors.orangeAccent, width: 2),
                      right: BorderSide(color: Colors.orangeAccent, width: 2),
                      top: BorderSide(color: Colors.orangeAccent, width: 2),
                      bottom: BorderSide(color: Colors.orangeAccent, width: 2)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
