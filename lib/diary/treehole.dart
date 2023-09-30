import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../system/userdata.dart';

class treehole extends StatefulWidget {
  const treehole({super.key});

  @override
  State<treehole> createState() => _treeholeState();
}

class _treeholeState extends State<treehole> {
  final titleController = TextEditingController();
  final contextController = TextEditingController();
  bool _isSend = false;

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
        appBar: AppBar(
          title: Text('投递给心协信箱'),
          backgroundColor: Color.fromARGB(255, 255, 189, 177),
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
            child: Container(
                child: ListView(
                  children: [
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      //height: 128,
                      alignment: Alignment.bottomRight,
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
                        border: Border.all(width: 1.0, color: Colors.black26),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ClipOval(
                                  child: Image(
                                    image: AssetImage('assets/images/not_login.png'),
                                  ),
                                ),
                                Text(
                                  basicData['username'],
                                  style: TextStyle(fontSize: 18),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          /*SizedBox(
                    height: 5,
                  ),*/

                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              children: [
                                ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 252, 223, 215)),
                                    foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.note_add,
                                        size: 18,
                                      ),
                                      Text('Step 1 书写笔记'),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.3,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset.zero,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1.0, color: Colors.black26),
                            ),
                            margin: EdgeInsets.fromLTRB(8, 10, 8, 10),
                            padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                            child: TextField(
                              controller: titleController,
                              //maxLines: 1,
                              decoration: InputDecoration(
                                hintText: "给日记起一个标题吧",
                                //border: OutlineInputBorder()
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.0,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset.zero,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 1.0, color: Colors.black26),
                            ),
                            margin: EdgeInsets.fromLTRB(8, 10, 8, 10),
                            padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
                            child: TextField(
                              controller: contextController,
                              maxLines: 20,
                              decoration: InputDecoration(
                                hintText: "在这里输入笔记内容",
                                //border: OutlineInputBorder()
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              //LikeButton(likeCount: likes,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                              ),
                              /*Text("发布于 ${province}   ${releaseTime}  ",style: TextStyle(
                        color: Colors.black45,
                      ),),*/
                            ],
                          ),

                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: _isSend == false
                          ? ElevatedButton(
                          onPressed: () async {
                            _isSend = true;
                            /*if (await checkInternet()) {
                              Get.snackbar('提示', '投递成功~我们会尽快为您处理回信。',
                                  duration: Duration(milliseconds: 1400));

                            } else {
                              Get.snackbar('提示', '投递失败。请检查互联网连接。',
                                  duration: Duration(milliseconds: 1400));
                            }*/
                            setState(() {

                            });
                          },
                          child: Text('投递到树洞'))
                          : ElevatedButton(
                        onPressed: () {
                          Get.back();
                          _isSend = false;
                        },
                        child: Text('返回'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 252, 223, 215)),
                          foregroundColor:
                          MaterialStateProperty.all(Colors.white),
                        ),
                      ),
                    ),

                    /*Container(
              height: MediaQuery.of(context).size.height * 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/treehole_bkgnd.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Opacity(
                opacity: 1,
                child: Container(
                  height: 400,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Opacity(opacity: 0.7,child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                          controller: titleController,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            labelText: '简单描述一下吧',
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                          ),
                        ),
                      )
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                          controller: contextController,
                          maxLines: 10,
                          decoration: InputDecoration(
                              hintText: "请输入多行文本",
                              border: OutlineInputBorder()),
                        ),

                      //Text("点击上传图片：",style: TextStyle(color: Colors.white),),

                      isSaved_mood == false
                          ? ElevatedButton(
                          onPressed: () {
                            if (selectedAsset_mood == null) {
                              Get.snackbar('提示', '您还未选择图片，请重新选择。',
                                  duration: Duration(milliseconds: 800));
                            } else {
                              setState(() {
                                saveMoodData();
                                saveBasicData();

                                Get.snackbar('提示', '保存成功~',
                                    duration: Duration(milliseconds: 800));
                              });
                            }
                          },
                          child: Text('保存'))
                          : ElevatedButton(
                          onPressed: () {
                            selectedAsset_mood == null;
                            Get.back();
                          },
                          child: Text('返回'))
                    ],
                  ),
                  decoration: BoxDecoration(
                    //color: Colors.white,
                      border: Border.all(
                        //color: Colors.white,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ),
            ),*/

                    SizedBox(
                      height: 40,
                    ),
                  ],
                ))));
  }
}
