import 'dart:math';
import 'package:get/get.dart';
import 'package:heart_voyage_new/pet/message.dart';
import 'package:heart_voyage_new/system/scan_test.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:flutter/material.dart';
import './add_friend.dart';
import './userdata.dart';

import 'change_avatar.dart';
import 'common_image.dart';

class friend extends StatefulWidget {
  @override
  _friendState createState() => _friendState();
}

class _friendState extends State<friend> {
  bool _isSelectedAvatar = !(PhotoPath_avatar[0] == "");
  final TextEditingController _controller = TextEditingController();
  String _myCode = '';

  @override
  void initState() {
    super.initState();
    // 初始化我的好友代码
    _myCode = generateFriendCode();
  }

  // 生成5位大写字母或数字的组合作为好友代码
  String generateFriendCode() {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    return List.generate(5, (index) => chars[random.nextInt(chars.length)])
        .join();
  }

  String generateQR(){
    String _name = basicData['username'];
    String _motto = basicData['motto'];
    String _code = _myCode;
    String _res = _name + '#' + _motto + '#' + _code;
    return _res;
  }

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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('我的好友'),
              IconButton(onPressed: (){
                Get.to(message());
              }, icon: Icon(Icons.mail)),
            ],
          ),
          ),
      body: Container(
        //padding: const EdgeInsets.all(16.0),
        child: ListView(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                margin: EdgeInsets.fromLTRB(12, 5, 12, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.2,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: _isSelectedAvatar
                          ? Avatar(image: imageFromFile(PhotoPath_avatar[0]).image)
                          : Avatar(image: AssetImage('assets/images/not_login.png')),

                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.2,),
                    Text("${basicData['username']}",style: TextStyle(fontSize: 20),),
                  ],
                ),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    blurStyle: BlurStyle.outer,
                    offset: Offset.zero,
                  ),],
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: (){}, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.person_add_alt_1),
                        Text(
                          "添加好友",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),],
                    ),),
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
                    SizedBox(width: 50,),
                    ElevatedButton(onPressed: (){}, child: Icon(Icons.refresh)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                margin: EdgeInsets.fromLTRB(12, 5, 12, 5),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        '我的好友代码',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Center(

                      child: Text(
                        '$_myCode',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 50, ),
                      ),
                    ),
                    Center(
                      child: QrImageView(
                        data: generateQR(),
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ),
                    ElevatedButton(onPressed: (){
                      Get.to(CustomizedMode());
                    }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Icon(Icons.person_add_alt_1),
                        Text(
                          "添加好友",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),],
                    ),),
                    /*ElevatedButton(onPressed: (){
                      Get.to(add_friend());
                    }, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //Icon(Icons.person_add_alt_1),
                        Text(
                          "点我添加好友",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),],
                    ),),*/
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),

                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    blurStyle: BlurStyle.outer,
                    offset: Offset.zero,
                  ),],
                  borderRadius: BorderRadius.circular(25),
                ),
              ),




          /*SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: '输入好友代码',
                      border: OutlineInputBorder(),
                      hintText: "不区分大小写"),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.1,),
              ElevatedButton(
                onPressed: () {
                  // 点击确认按钮后的操作
                  final friendCode = _controller.text;
                  print('添加好友：$friendCode');
                },
                child: Text('确认'),
              ),
            ],
          ),*/
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: (){}, child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.person_add_alt_1),
                        Text(
                          "我的好友",
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),],
                    ),),
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
                    SizedBox(width: 50,),
                    ElevatedButton(onPressed: (){}, child: Icon(Icons.refresh)),
                  ],
                ),
              ),
              Container(
                height: 80,
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                margin: EdgeInsets.fromLTRB(12, 5, 12, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: Text("您暂时没有好友。"),
                    )
                    ]

                ),
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10.0,
                    spreadRadius: 0.0,
                    blurStyle: BlurStyle.outer,
                    offset: Offset.zero,
                  ),],
                  borderRadius: BorderRadius.circular(25),
                ),
              ),

          //SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        ]),
      ),
    );
  }
}
