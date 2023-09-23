import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './CDMAS_check.dart';


import 'CDMAS_instruction.dart';

class CreateCDMAS_Scale extends StatefulWidget {
  final String question;

  CreateCDMAS_Scale({Key? key, required this.question}) : super(key: key);

  @override
  State<CreateCDMAS_Scale> createState() => _CreateCDMAS_ScaleState();
}

class _CreateCDMAS_ScaleState extends State<CreateCDMAS_Scale> {
  String? _groupValue = "从不";
  int _deltaValue = 0;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.question,
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, fontFamily: 'FZ_Kaiti'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '从不',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "从不",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_CDMAS -= _deltaValue;
                    _deltaValue = 0;
                    score_CDMAS += _deltaValue;
                  });
                }),
            Text(
              '偶尔',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "偶尔",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_CDMAS -= _deltaValue;
                    _deltaValue = 1;
                    score_CDMAS += _deltaValue;
                  });
                })
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '有时',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "有时",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_CDMAS -= _deltaValue;
                    _deltaValue = 2;
                    score_CDMAS += _deltaValue;
                  });
                }),
            Text(
              '经常',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "经常",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_CDMAS -= _deltaValue;
                    _deltaValue = 3;
                    score_CDMAS += _deltaValue;
                  });
                }),
            Text(
              '总是',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "总是",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_CDMAS -= _deltaValue;
                    _deltaValue = 4;
                    score_CDMAS += _deltaValue;
                  });
                })
          ],
        )
      ],
    );;
  }
}

int score_CDMAS = 0;

class CDMAS_scale extends StatefulWidget {
  const CDMAS_scale({Key? key}) : super(key: key);

  @override
  State<CDMAS_scale> createState() => _CDMAS_scaleState();
}

class _CDMAS_scaleState extends State<CDMAS_scale> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('大学生择业焦虑量表'),
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
                        Get.to(() => CDMAS_instruction());
                      },
                      child: Text(
                        '点我看看说明',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '    请根据自己的情况对于每个问题，从"从不"、"偶尔"、"有时"、"经常"、"总是"五项中选择一项',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
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
                    CreateCDMAS_Scale(question: '1.当我考虑自己的职业选择时，我感到紧张不安'),
                    Divider(),
                    CreateCDMAS_Scale(question: '2.在做职业决策时，我感到很迷茫'),
                    Divider(),
                    CreateCDMAS_Scale(question: '3.我对自己的职业选择是否正确感到担忧'),
                    Divider(),
                    CreateCDMAS_Scale(question: '4.当我思考自己的职业未来时，我感到害怕'),
                    Divider(),
                    CreateCDMAS_Scale(question: '5.在做职业决策时，我感到犹豫不决'),
                    Divider(),
                    CreateCDMAS_Scale(question: '6.我对于未来的职业生涯是否成功充满了疑虑'),
                    Divider(),
                    CreateCDMAS_Scale(question: '7.在做职业决策时，我常常会感到紧张和不安'),
                    Divider(),
                    CreateCDMAS_Scale(question: '8.当我尝试做职业决策时，我常常会感到无法确定'),
                    Divider(),
                    CreateCDMAS_Scale(question: '9.我对自己的职业选择是否能够满足自己的期望感到担忧'),
                    Divider(),
                    CreateCDMAS_Scale(question: '10.在做职业决策时，我感到很困惑'),
                    Divider(),
                    CreateCDMAS_Scale(question: '11.我对于职业选择的结果是否会对我未来的生活产生重要影响感到害怕'),
                    Divider(),
                    CreateCDMAS_Scale(question: '12.在做职业决策时，我感到很矛盾'),
                    Divider(),
                    CreateCDMAS_Scale(question: '13.我对自己的职业决策是否明智感到担忧'),
                    Divider(),
                    CreateCDMAS_Scale(question: '14.当我考虑自己的职业未来时，我感到紧张和不安'),
                    Divider(),
                    CreateCDMAS_Scale(question: '15.在做职业决策时，我常常会感到很难做出选择'),
                    Divider(),
                    CreateCDMAS_Scale(question: '16.我对于自己的职业选择是否能够符合社会的期望感到担忧'),
                    Divider(),
                    CreateCDMAS_Scale(question: '17.在做职业决策时，我感到很犹豫'),
                    Divider(),
                    CreateCDMAS_Scale(question: '18.我对自己的职业选择是否会对我未来的幸福产生重要影响感到害怕'),
                  ],
                )
            ),

            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  /*basicData["moodscore"] = score_ITS;
                  saveBasicData();*/
                  //上面两注释掉，下面一行get内改成check。。。
                  Get.to(CDMAS_check(), arguments: score_CDMAS);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(224, 167, 63, 1)),
                  foregroundColor:
                  MaterialStateProperty.all(Color.fromRGBO(90, 66, 53, 1)),
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



