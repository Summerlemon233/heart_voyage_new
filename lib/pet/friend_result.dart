import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../system/change_avatar.dart';

class friend_result extends StatefulWidget {
  const friend_result({super.key});

  @override
  State<friend_result> createState() => _friend_resultState();
}

class _friend_resultState extends State<friend_result> {
  late final String code;
  late final resolveQR;
  bool isValid = true;

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
  void initState() {
    code = Get.arguments;
    // TODO: implement initState
    if (code.indexOf('#') != -1) {
      resolveQR = code.split('#');
    } else {
      resolveQR = '无效的二维码';
      isValid = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('扫描结果'),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Center(
          child: isValid
              ? ListView(
                  children: [
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      margin: EdgeInsets.fromLTRB(12, 5, 12, 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.width * 0.2,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Avatar(
                                    image:
                                        AssetImage('assets/images/rabbit.png')),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.2,
                              ),
                              Text(
                                "${resolveQR[0]}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text("个性签名：${resolveQR[1]}"),
                          SizedBox(height: 10),
                          Center(
                            child: Text(
                              'Ta的好友代码',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          Center(
                            child: Text(
                              '${resolveQR[2]}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 50,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),

                          ElevatedButton(
                              onPressed: () async{
                                setState(() async{
                                  if(await checkInternet()) {
                                    EasyLoading.showSuccess('好友申请已发送。');
                                  }
                                  else
                                  {
                                    EasyLoading.showError('设备没有连接到互联网。请检查网络连接。');
                                  }
                              });

                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.add_reaction_outlined),
                                  Text(
                                    "发送好友申请",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              )),
                          SizedBox(height: 10)
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                            blurStyle: BlurStyle.outer,
                            offset: Offset.zero,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    /*Text(code),
                    Text("用户名：${resolveQR[0]}"),
                    Text("好友代码：${resolveQR[2]}"),*/
                    SizedBox(height: 30),
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Icon(
                      Icons.warning,
                      size: 100,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '您扫描的二维码无效，内容如下：\n${code}\n请重新扫描。',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
        ),
      )),
      /*floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(),
        onPressed: () {
          setState(() {
            Get.to(new_diary());
          });
        },
        child: Icon(Icons.add),
      ),*/
    );
    ;
  }
}
