import 'package:flutter/material.dart';

class XINXIE extends StatefulWidget {
  const XINXIE({Key? key}) : super(key: key);

  @override
  State<XINXIE> createState() => _XINXIEState();
}

class _XINXIEState extends State<XINXIE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 220, 203, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(45, 73, 104, 1),
        foregroundColor: Colors.white,
        title: Text('详细信息'),
      ),
      body: ListView(
        children: [Container(

          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Center(
            child: Text(
              "可以选择将你的信件发送至北大心协“解忧杂货铺”收信箱"
                  "（是一个由学生发起的、匿名的线上写信渠道，"
                  "旨在为有困扰的同学提供一个温暖安全的、倾诉和寻求支持的平台），"
                  "信件将尽量在48h内获得非公开回复，"
                  "其中回信店员都是有心理学背景或对心理健康工作有热情的北大在校学生，"
                  "接受过8次回信培训，能够保证基本的倾听支持并提供非专业帮助。\n"
                  "北京大学学生心理协会（以下简称“北大心协”）"
                  "依托于北京大学学生心理健康教育与咨询中心，借助其丰富而优质的专业教师资源，"
                  "开展各种丰富精彩的专题活动，为心理学爱好者提供实践与体验的平台。"
              ,style: TextStyle(fontSize: 20,color: Color.fromRGBO(215, 169, 83, 1)),),
          ),
          decoration: BoxDecoration(
            /*border: Border.all(
              color: Colors.brown,
              width: 3.0,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20.0))),*/
          ),
        )],
      )
      );
  }
}
