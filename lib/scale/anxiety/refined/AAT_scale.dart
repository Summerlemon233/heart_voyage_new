import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './AAT_check.dart';
import './AAT_instruction.dart';


class CreateAAT_Scale extends StatefulWidget {
  final String question;
  final int mode;
  final int mode1;

  CreateAAT_Scale({Key? key, required this.question,required this.mode,required this.mode1}) : super(key: key);

  @override
  State<CreateAAT_Scale> createState() => _CreateAAT_ScaleState();
}

class _CreateAAT_ScaleState extends State<CreateAAT_Scale> {
  String? _groupValue = "从来没有";
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
              '从来没有',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "从来没有",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    if(widget.mode1==1)
                      score_AAT1 -= _deltaValue;
                    else
                      score_AAT2 -= _deltaValue;

                    if(widget.mode==1) _deltaValue = 1;
                    else _deltaValue = 5;

                    if(widget.mode1==1)
                      score_AAT1 += _deltaValue;
                    else
                      score_AAT2 += _deltaValue;
                  });
                }),
            Text(
              '很少',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "很少",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    if(widget.mode1==1)
                      score_AAT1 -= _deltaValue;
                    else
                      score_AAT2 -= _deltaValue;

                    if(widget.mode==1) _deltaValue = 2;
                    else _deltaValue = 4;

                    if(widget.mode1==1)
                      score_AAT1 += _deltaValue;
                    else
                      score_AAT2 += _deltaValue;
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
                    if(widget.mode1==1)
                      score_AAT1 -= _deltaValue;
                    else
                      score_AAT2 -= _deltaValue;

                    _deltaValue = 3;

                    if(widget.mode1==1)
                      score_AAT1 += _deltaValue;
                    else
                      score_AAT2 += _deltaValue;
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
                    if(widget.mode1==1)
                      score_AAT1 -= _deltaValue;
                    else
                      score_AAT2 -= _deltaValue;

                    if(widget.mode==1) _deltaValue = 4;
                    else _deltaValue = 2;

                    if(widget.mode1==1)
                      score_AAT1 += _deltaValue;
                    else
                      score_AAT2 += _deltaValue;
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
                    if(widget.mode1==1)
                      score_AAT1 -= _deltaValue;
                    else
                      score_AAT2 -= _deltaValue;

                    if(widget.mode==1) _deltaValue = 5;
                    else _deltaValue = 1;

                    if(widget.mode1==1)
                      score_AAT1 += _deltaValue;
                    else
                      score_AAT2 += _deltaValue;
                  });
                })
          ],
        )
      ],
    );;
  }
}

int score_AAT1 = 0; //积极作用
int score_AAT2 = 0; //消极作用

class AAT_scale extends StatefulWidget {
  const AAT_scale({Key? key}) : super(key: key);

  @override
  State<AAT_scale> createState() => _AAT_scaleState();
}

class _AAT_scaleState extends State<AAT_scale> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('考试焦虑影响量表'),
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
                        Get.to(() => AAT_instruction());
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
                  CreateAAT_Scale(question: '1.参加考试或考试时的紧张阻碍了我取得好成绩',mode:1,mode1:2),
                  Divider(),
                  CreateAAT_Scale(question: '2.我在压力下工作得最有效，因为任务非常重要',mode:1,mode1:1),
                  Divider(),
                  CreateAAT_Scale(question: '3.在我一直表现不佳的课程中，我对成绩不佳的恐惧降低了我的效率',mode:2,mode1:2),
                  Divider(),
                  CreateAAT_Scale(question: '4.当我为考试或考试准备不足时，我会感到不安，甚至比我有限的知识所允许的要差',mode:2,mode1:2),
                  Divider(),
                  CreateAAT_Scale(question: '5.考试越重要，我似乎做得越差',mode:1,mode1:2),
                  Divider(),
                  CreateAAT_Scale(question: '6.虽然在参加考试之前我可能（也可能不）紧张，但一旦我开始，我似乎忘记了紧张',mode:1,mode1:1),
                  Divider(),
                  CreateAAT_Scale(question: '7.在考试或测试期间，我会阻止我知道答案的问题，即使考试一结束，我可能会记住它们',mode:1,mode1:2),
                  Divider(),
                  CreateAAT_Scale(question: '8.参加考试时的紧张帮助我做得更好',mode:2,mode1:1),
                  Divider(),
                  CreateAAT_Scale(question: '9.当我开始测试时，没有什么能分散我的注意力',mode:1,mode1:1),
                  Divider(),
                  CreateAAT_Scale(question: '10.在总成绩主要基于“一次”考试的课程中，我似乎比其他人做得更好',mode:2,mode1:1),
                  Divider(),
                  CreateAAT_Scale(question: '11.我发现考试开始时我的大脑一片空白，我花了几分钟才能正常工作',mode:1,mode1:2),
                  Divider(),
                  CreateAAT_Scale(question: '12.我期待着考试',mode:2,mode1:1),
                  Divider(),
                  CreateAAT_Scale(question: '13.我担心考试太累了，以至于我发现当我开始考试时，我几乎不在乎自己做得有多好',mode:2,mode1:2),
                  Divider(),
                  CreateAAT_Scale(question: '14.在类似的条件下，考试的时间压力导致我的表现比小组其他成员更糟糕',mode:1,mode1:2),
                  Divider(),
                  CreateAAT_Scale(question: '15.虽然在考试前紧张的情况下“抱佛脚”对大多数人来说是无效的，但我发现，如果需要，即使在相当大的压力下，我也可以在考试前立即学习材料，并成功掌握材料用于考试',mode:1,mode1:1),
                  Divider(),
                  CreateAAT_Scale(question: '16.我喜欢参加难题考试，而不是简单的考试',mode:1,mode1:1),
                  Divider(),
                  CreateAAT_Scale(question: '17.我发现自己在阅读考试题时却不理解它们，我必须复习一遍，这样它们才有意义',mode:2,mode1:2),
                  Divider(),
                  CreateAAT_Scale(question: '18.考试或考试越重要，我似乎做得越好',mode:1,mode1:1),
                  Divider(),
                  CreateAAT_Scale(question: '19.当我在考试开始时在难题上表现不佳时，这往往会让我心烦意乱，所以我以后会阻挡甚至简单的问题',mode:2,mode1:2),
                  ],
              )
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
                  List<int> args=[score_AAT1,score_AAT2];
                  Get.to(AAT_check(), arguments: args);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(251, 231, 187, 1)),
                  foregroundColor: MaterialStateProperty.all(
                      Color.fromRGBO(255, 153, 148, 1)),
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



