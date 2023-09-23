import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './AASR_check.dart';
import './AASR_instruction.dart';

class CreateAASR_Scale extends StatefulWidget {
  final String question;
  final int mode;
  final int mode1;

  CreateAASR_Scale(
      {Key? key,
      required this.question,
      required this.mode,
      required this.mode1})
      : super(key: key);

  @override
  State<CreateAASR_Scale> createState() => _CreateAASR_ScaleState();
}

class _CreateAASR_ScaleState extends State<CreateAASR_Scale> {
  String? _groupValue = "完全不符合";
  int _deltaValue = 1;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.question,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20, fontFamily: 'FZ_Kaiti'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '完全不符合',
                style: TextStyle(fontFamily: 'FZ_Kaiti'),
              ),
              Radio(
                  value: "完全不符合",
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = value;
                      if (widget.mode1 == 1)
                        score_AASR1 -= _deltaValue;
                      else if (widget.mode1 == 2)
                        score_AASR2 -= _deltaValue;
                      else
                        score_AASR3 -= _deltaValue;

                      if (widget.mode == 1)
                        _deltaValue = 1;
                      else
                        _deltaValue = 5;

                      if (widget.mode1 == 1)
                        score_AASR1 += _deltaValue;
                      else if (widget.mode1 == 2)
                        score_AASR2 += _deltaValue;
                      else
                        score_AASR3 += _deltaValue;
                    });
                  }),
              Text(
                '较不符合',
                style: TextStyle(fontFamily: 'FZ_Kaiti'),
              ),
              Radio(
                  value: "较不符合",
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = value;
                      if (widget.mode1 == 1)
                        score_AASR1 -= _deltaValue;
                      else if (widget.mode1 == 2)
                        score_AASR2 -= _deltaValue;
                      else
                        score_AASR3 -= _deltaValue;

                      if (widget.mode == 1)
                        _deltaValue = 2;
                      else
                        _deltaValue = 4;

                      if (widget.mode1 == 1)
                        score_AASR1 += _deltaValue;
                      else if (widget.mode1 == 2)
                        score_AASR2 += _deltaValue;
                      else
                        score_AASR3 += _deltaValue;
                    });
                  })
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '不能确定',
                style: TextStyle(fontFamily: 'FZ_Kaiti'),
              ),
              Radio(
                  value: "不能确定",
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = value;
                      if (widget.mode1 == 1)
                        score_AASR1 -= _deltaValue;
                      else if (widget.mode1 == 2)
                        score_AASR2 -= _deltaValue;
                      else
                        score_AASR3 -= _deltaValue;

                      _deltaValue = 3;

                      if (widget.mode1 == 1)
                        score_AASR1 += _deltaValue;
                      else if (widget.mode1 == 2)
                        score_AASR2 += _deltaValue;
                      else
                        score_AASR3 += _deltaValue;
                    });
                  }),
              Text(
                '较符合',
                style: TextStyle(fontFamily: 'FZ_Kaiti'),
              ),
              Radio(
                  value: "较符合",
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = value;
                      if (widget.mode1 == 1)
                        score_AASR1 -= _deltaValue;
                      else if (widget.mode1 == 2)
                        score_AASR2 -= _deltaValue;
                      else
                        score_AASR3 -= _deltaValue;

                      if (widget.mode == 1)
                        _deltaValue = 4;
                      else
                        _deltaValue = 2;

                      if (widget.mode1 == 1)
                        score_AASR1 += _deltaValue;
                      else if (widget.mode1 == 2)
                        score_AASR2 += _deltaValue;
                      else
                        score_AASR3 += _deltaValue;
                    });
                  }),
              Text(
                '完全符合',
                style: TextStyle(fontFamily: 'FZ_Kaiti'),
              ),
              Radio(
                  value: "完全符合",
                  groupValue: _groupValue,
                  onChanged: (value) {
                    setState(() {
                      _groupValue = value;
                      if (widget.mode1 == 1)
                        score_AASR1 -= _deltaValue;
                      else if (widget.mode1 == 2)
                        score_AASR2 -= _deltaValue;
                      else
                        score_AASR3 -= _deltaValue;

                      if (widget.mode == 1)
                        _deltaValue = 5;
                      else
                        _deltaValue = 1;

                      if (widget.mode1 == 1)
                        score_AASR1 += _deltaValue;
                      else if (widget.mode1 == 2)
                        score_AASR2 += _deltaValue;
                      else
                        score_AASR3 += _deltaValue;
                    });
                  })
            ],
          )
        ],
      ),
    );
  }
}

int score_AASR1 = 0;
int score_AASR2 = 0;
int score_AASR3 = 0;

class AASR_scale extends StatefulWidget {
  const AASR_scale({Key? key}) : super(key: key);

  @override
  State<AASR_scale> createState() => _AASR_scaleState();
}

class _AASR_scaleState extends State<AASR_scale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('成人依恋量表'),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              /*decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(90, 66, 53, 1))),*/
              child: Column(
                children: [
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Color.fromRGBO(251, 231, 187, 1)),
                        foregroundColor:
                        MaterialStateProperty.all(Color.fromRGBO(255, 153, 148, 1)),
                      ),
                      onPressed: () {
                        Get.to(() => AASR_instruction());
                      },
                      child: Text(
                        '点我看看说明',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  /*child: */

                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      '请根据自己的实际情况选择最符合自己的选项。',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              width: MediaQuery.of(context).size.width,
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
              child: Column(
                children: [
                  CreateAASR_Scale(
                      question: '1.我发现与人亲近比较容易', mode: 1, mode1: 1),
                  Divider(),
                  CreateAASR_Scale(
                      question: '2.我发现要我去依赖别人很困难', mode: 2, mode1: 2),
                  Divider(),
                  CreateAASR_Scale(
                      question: '3.我时常担心情侣并不真心爱我', mode: 1, mode1: 3),
                  Divider(),
                  CreateAASR_Scale(
                      question: '4.我发现别人并不愿像我希望的那样亲近我', mode: 1, mode1: 3),
                  Divider(),
                  CreateAASR_Scale(
                      question: '5.能依赖别人让我感到很舒服', mode: 1, mode1: 2),
                  Divider(),
                  CreateAASR_Scale(question: '6.我不在乎别人太亲近我', mode: 1, mode1: 1),
                  Divider(),
                  CreateAASR_Scale(
                      question: '7.我发现当我需要别人帮助时，没人会帮我', mode: 2, mode1: 2),
                  Divider(),
                  CreateAASR_Scale(
                      question: '8.和别人亲近使我感到有些不舒服', mode: 2, mode1: 1),
                  Divider(),
                  CreateAASR_Scale(
                      question: '9.我时常担心情侣不想和我待在一起', mode: 1, mode1: 3),
                  Divider(),
                  CreateAASR_Scale(
                      question: '10.当我对别人表达我的情感时，我害怕他们与我的感觉会不一样',
                      mode: 1,
                      mode1: 3),
                  Divider(),
                  CreateAASR_Scale(
                      question: '11.我时常怀疑情侣是否真正关心我', mode: 1, mode1: 3),
                  Divider(),
                  CreateAASR_Scale(
                      question: '12.我对与别人建立亲密的关系感到很舒服', mode: 1, mode1: 1),
                  Divider(),
                  CreateAASR_Scale(
                      question: '13.当有人在情感上太亲近我时，我感到不舒服', mode: 2, mode1: 1),
                  Divider(),
                  CreateAASR_Scale(
                      question: '14.我知道当我需要别人帮助时，总有人会帮我', mode: 1, mode1: 2),
                  Divider(),
                  CreateAASR_Scale(
                      question: '15.我想与人亲近,但担心自己会受到伤害', mode: 1, mode1: 3),
                  Divider(),
                  CreateAASR_Scale(
                      question: '16.我发现我很难完全信赖别人', mode: 2, mode1: 2),
                  Divider(),
                  CreateAASR_Scale(
                      question: '17.情侣想要我在情感上更亲近一些，这常使我感到不舒服',
                      mode: 2,
                      mode1: 1),
                  Divider(),
                  CreateAASR_Scale(
                      question: '18.我不能肯定，在我需要时，总找得到可以依赖的人', mode: 2, mode1: 2),
                  //Divider(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
           Center(
             child: ElevatedButton(
               onPressed: () {
                 /*basicData["moodscore"] = score_ITS;
                  saveBasicData();*/
                 //上面两注释掉，下面一行get内改成check。。。
                 List<int> args = [score_AASR1, score_AASR2, score_AASR3];
                 Get.to(AASR_check(), arguments: args);
               },
               style: ButtonStyle(
                 backgroundColor:
                 MaterialStateProperty.all(Color.fromRGBO(251, 231, 187, 1)),
                 foregroundColor:
                 MaterialStateProperty.all(Color.fromRGBO(255, 153, 148, 1)),
               ),
               child: Text(
                 "点击查看分数",
                 style: TextStyle(fontSize: 20),
               ),
             ),
           ),


            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
