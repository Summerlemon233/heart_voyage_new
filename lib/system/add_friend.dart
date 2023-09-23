import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:get/get.dart';
import 'package:heart_voyage_new/pet/friend_result.dart';

class add_friend extends StatefulWidget {
  @override
  _add_friendState createState() => _add_friendState();
}

class _add_friendState extends State<add_friend> {
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

  final TextEditingController _controller = TextEditingController();
  var permissions = const [
    Permissions.READ_EXTERNAL_STORAGE,
    Permissions.CAMERA
  ];

  var permissionGroup = const [PermissionGroup.Camera, PermissionGroup.Photos];
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
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16),
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
                      setState(() async {
                        if (await checkInternet()) {
                          EasyLoading.showSuccess('好友申请已发送。');
                        } else {
                          EasyLoading.showError('设备没有连接到互联网。请检查网络连接。');
                        }
                      });
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
                Text(
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
                    }),
              ],
            )));
  }
}

const boxSize = 225.0;

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
        Get.to(friend_result(), arguments: result.originalValue);
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

class add_friend_legacy extends StatefulWidget {
  const add_friend_legacy({Key? key}) : super(key: key);

  @override
  State<add_friend_legacy> createState() => _add_friend_legacyState();
}

class _add_friend_legacyState extends State<add_friend_legacy> {
  ScanKitDecoder decoder = ScanKitDecoder(scanTypes: ScanTypes.qRCode.bit);
  final TextEditingController _controller = TextEditingController();
  var permissions = const [
    Permissions.READ_EXTERNAL_STORAGE,
    Permissions.CAMERA
  ];

  var permissionGroup = const [PermissionGroup.Camera, PermissionGroup.Photos];
  ScanKit? scanKit;
  String code = "";

  /*void load()async{
    final List<AssetEntity>? selectedImg = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        maxAssets: 1,
        requestType: RequestType.image,
      ),
    );

    Image tmpImg = AssetEntityImage(selectedImg!.first, isOriginal: true);
    var tmpByteDataFromImg = await tmpImg.toByteData();
    var myData = await rootBundle.load('assets/qrcode.png');
    var imgRes = await decoder.decodeImage(myData.buffer.asUint8List());
    if(result.isNotEmpty){
      setState(() {
        code = result.originalValue;
      });
    }
  }*/

  @override
  void initState() {
    super.initState();
    scanKit = ScanKit();
    scanKit!.onResult.listen((val) {
      debugPrint(
          "scanning result:${val.originalValue}  scanType:${val.scanType}");
      setState(() {
        code = val.originalValue;
      });
    });

    FlutterEasyPermission().addPermissionCallback(
        onGranted: (requestCode, perms, perm) {
          startScan();
        },
        onDenied: (requestCode, perms, perm, isPermanent) {});
  }

  @override
  void dispose() {
    scanKit?.dispose();
    _controller.dispose();
    super.dispose();
  }

  Future<void> startScan() async {
    try {
      await scanKit?.startScan(
          scanTypes: ScanTypes.qRCode.bit |
              ScanTypes.code39.bit |
              ScanTypes.code128.bit);
    } catch (e) {
      debugPrint(e.toString());
    }
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
                onPressed: () {
                  // 点击确认按钮后的操作
                  final friendCode = _controller.text;
                  print('添加好友：$friendCode');
                },
                child: Text('确认'),
              ),
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

                    //ElevatedButton(onPressed: (){}, child: Icon(Icons.refresh)),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text("扫描二维码"),
                onPressed: () async {
                  if (!await FlutterEasyPermission.has(
                      perms: permissions, permsGroup: permissionGroup)) {
                    FlutterEasyPermission.request(
                        perms: permissions, permsGroup: permissionGroup);
                  } else {
                    startScan();
                  }
                },
              ),
              ElevatedButton(
                child: Text("选取图库中的二维码"),
                onPressed: () async {},
              ),
            ],
          ),
        ),
      ),
      /*Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
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
                  startScan();
                }
              },
            ),
          ],
        ),
      ),*/
    );
  }
}

/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:get/get.dart';
import 'package:heart_voyage_new/pet/friend_result.dart';
*/ /*import 'package:flutter_hms_scan_kit/flutter_hms_scan_kit.dart';
import 'package:flutter_hms_scan_kit/scan_result.dart';*/ /*

class add_friend extends StatefulWidget {
  const add_friend({super.key});

  @override
  State<add_friend> createState() => _add_friendState();
}

class _add_friendState extends State<add_friend> {
  ScanKit? scanKit;
  String code = "";





  //ScanResult? _scanResult;
  late bool isCustom;
  var permissions = const [
    Permissions.READ_EXTERNAL_STORAGE,
    Permissions.CAMERA
  ];

  var permissionGroup = const [
    PermissionGroup.Camera,
    PermissionGroup.Photos
  ];


  //String result = "";

  */ /*var _permissions = const [
    Permissions.READ_EXTERNAL_STORAGE,
    Permissions.CAMERA
  ];

  var _permissionGroup = const [PermissionGroup.Camera, PermissionGroup.Photos];*/ /*

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    scanKit = ScanKit();
    scanKit!.onResult.listen((val) {
      debugPrint(
          "scanning result:${val.originalValue}  scanType:${val.scanType}");
      setState(() {
        code = val.originalValue;
        Get.to(friend_result(),arguments: code);
      });
    });

    FlutterEasyPermission().addPermissionCallback(
        onGranted: (requestCode, perms, perm) {
          startScan();
        },
        onDenied: (requestCode, perms, perm, isPermanent) {});
  }

  @override
  void dispose() {
    scanKit?.dispose();
    super.dispose();
  }

  Future<void> startScan() async {
    try {
      await scanKit?.startScan(
          scanTypes: ScanTypes.qRCode.bit |
          ScanTypes.code39.bit |
          ScanTypes.code128.bit);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  */ /*Future<void> scan() async {
    _scanResult = await FlutterHmsScanKit.startScan();
    setState(() {
      Get.to(friend_result(), arguments: _scanResult);
    });
  }*/ /*

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
                onPressed: () {
                  // 点击确认按钮后的操作
                  final friendCode = _controller.text;
                  print('添加好友：$friendCode');
                },
                child: Text('确认'),
              ),
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
                    //ElevatedButton(onPressed: (){}, child: Icon(Icons.refresh)),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}*/
