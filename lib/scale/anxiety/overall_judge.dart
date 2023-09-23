import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../system/userdata.dart';
import '../../system/userdata_func.dart';
import 'anxiety_instruction.dart';
import 'check_overall_score.dart';


class CreateAnxietyOverallScale extends StatefulWidget {
  final String question;

  CreateAnxietyOverallScale({Key? key, required this.question}) : super(key: key);

  @override
  State<CreateAnxietyOverallScale> createState() => _CreateAnxietyOverallScaleState();
}

class _CreateAnxietyOverallScaleState extends State<CreateAnxietyOverallScale> {
  String? _groupValue = "没有";
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
              '没有',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "没有",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_overall_anxiety -= _deltaValue;
                    _deltaValue = 0;
                    score_overall_anxiety += _deltaValue;
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
                    score_overall_anxiety -= _deltaValue;
                    _deltaValue = 1;
                    score_overall_anxiety += _deltaValue;
                  });
                })
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '有一半以上时间',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "有一半以上时间",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_overall_anxiety -= _deltaValue;
                    _deltaValue = 2;
                    score_overall_anxiety += _deltaValue;
                  });
                }),
            Text(
              '几乎天天',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "几乎天天",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_overall_anxiety -= _deltaValue;
                    _deltaValue = 3;
                    score_overall_anxiety += _deltaValue;
                  });
                })
          ],
        )
      ],
    );;
  }
}

int score_overall_anxiety = 0;

class overall_judge extends StatefulWidget {
  const overall_judge({Key? key}) : super(key: key);

  @override
  State<overall_judge> createState() => _overall_judgeState();
}

class _overall_judgeState extends State<overall_judge> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('焦虑自测'),
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
                        Get.to(() => anxiety_instruction());
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
                  Center(
                    child: Text(
                      '在过去的两周里，你生活中有多少天出现以下的症状？请选择你认为最符合的选项。',
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
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              //width: MediaQuery.of(context).size.width,
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
                  CreateAnxietyOverallScale(question: '1.感到不安、担心及烦躁'),
                  Divider(),
                  CreateAnxietyOverallScale(question: '2.不能停止担心或控制不了担心'),
                  Divider(),
                  CreateAnxietyOverallScale(question: '3.对各种各样的事情过度担心'),
                  Divider(),
                  CreateAnxietyOverallScale(question: '4.很紧张，很难放松下来'),
                  Divider(),
                  CreateAnxietyOverallScale(question: '5.非常焦躁，以至无法静坐'),
                  Divider(),
                  CreateAnxietyOverallScale(question: '6.变得容易烦恼或易被激怒'),
                  Divider(),
                  CreateAnxietyOverallScale(question: '7.感到好像有什么可怕的事会发生'),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  //basicData["moodScore"] = score_overall_anxiety;
                  //saveBasicData();
                  Get.to(check_overall_score(), arguments: score_overall_anxiety);
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


