import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './FIS_check.dart';
import './FIS_instruction.dart';

class CreateFIS_Scale extends StatefulWidget {
  final String question;

  CreateFIS_Scale({Key? key, required this.question}) : super(key: key);

  @override
  State<CreateFIS_Scale> createState() => _CreateFIS_ScaleState();
}

class _CreateFIS_ScaleState extends State<CreateFIS_Scale> {
  String? _groupValue = "完全不像我";
  int _deltaValue = 1;

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
              '完全不像我',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "完全不像我",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_FIS -= _deltaValue;
                    _deltaValue = 1;
                    score_FIS += _deltaValue;
                  });
                }),
            Text(
              '有一点像我',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "有一点像我",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_FIS -= _deltaValue;
                    _deltaValue = 2;
                    score_FIS += _deltaValue;
                  });
                })
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '中度像我',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "中度像我",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_FIS -= _deltaValue;
                    _deltaValue = 3;
                    score_FIS += _deltaValue;
                  });
                }),
            Text(
              '比较像我',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "比较像我",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_FIS -= _deltaValue;
                    _deltaValue = 4;
                    score_FIS += _deltaValue;
                  });
                }),
            Text(
              '非常像我',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "非常像我",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_FIS -= _deltaValue;
                    _deltaValue = 5;
                    score_FIS += _deltaValue;
                  });
                })
          ],
        )
      ],
    );
    ;
  }
}

int score_FIS = 0;

class FIS_scale extends StatefulWidget {
  const FIS_scale({Key? key}) : super(key: key);

  @override
  State<FIS_scale> createState() => _FIS_scaleState();
}

class _FIS_scaleState extends State<FIS_scale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('亲密关系焦虑量表'),
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
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(251, 231, 187, 1)),
                      foregroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(255, 153, 148, 1)),
                    ),
                    onPressed: () {
                      Get.to(FIS_instruction());
                    },
                    child: Text(
                      "点我看看说明",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                      /*child: */
                      ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '    假设你处于一段恋爱关系中，根据下面各个题目的描述用 1-5分来评估题中所述与你的符合程度，他(她)指的是现实或想象中的男朋友或女朋友，请选择相应的选项。',
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
                children: [CreateFIS_Scale(question: '1.把过去我觉得羞耻的事情告诉他(她)，我会感到不舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '2.和他(她)讨论对我伤害很大的事情，我感到不自在'),
                  Divider(),
                  CreateFIS_Scale(question: '3.向他(她) 表达自己的真实情感，我会感到不舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '4.如果他(她)很沮丧，有时我害怕表达我对他(她)的关心'),
                  Divider(),
                  CreateFIS_Scale(question: '5.我可能会害怕向他(她)倾诉内心深处的情感'),
                  Divider(),
                  CreateFIS_Scale(question: '6.我不会很自然的告诉他(她)，我在乎他(她)'),
                  Divider(),
                  CreateFIS_Scale(question: '7.和他(她)在一起时我不会感到我们是完全合一的'),
                  Divider(),
                  CreateFIS_Scale(question: '8.和他(她)讨论重要问题，我不会感到很舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '9.某种程度上，我害怕向他(她) 做出长期的承诺'),
                  Divider(),
                  CreateFIS_Scale(question: '10.把我的经历告诉他(她)，我不会感到很舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '11.向他(她)表达强烈的情感时，我会感到很紧张'),
                  Divider(),
                  CreateFIS_Scale(question: '12.我很难向他(她)坦露我的个人想法'),
                  Divider(),
                  CreateFIS_Scale(question: '13.如果他(她)依赖我获得情感支持，这会让我感到不舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '14.我害怕与他(她)分享我讨厌自己的地方'),
                  Divider(),
                  CreateFIS_Scale(question: '15.与他(她)建立更亲密的关系，我担心自己会被伤害'),
                  Divider(),
                  CreateFIS_Scale(question: '16.向他(她)保留我的个人隐私，这让我感到不舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '17.我会因为对他(她)有自发的表达而感到紧张'),
                  Divider(),
                  CreateFIS_Scale(question: '18.把我没有告诉其它人的事情告诉他(她)，我会感到不舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '19.把自己深层的想法和情感告诉他(她)，我会觉得不舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '20.如果他(她)把非常私密的事情告诉我，我有时会感到不自在'),
                  Divider(),
                  CreateFIS_Scale(question: '21.把我认为自己身上存在的缺点告诉他(她)，我会觉得不舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '22.在我们之间存在的紧密的情感纽带让我感到不舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '23.我害怕和他(她)分享我的私人想法'),
                  Divider(),
                  CreateFIS_Scale(question: '24.我担心也许不能一直感到亲近他(她)'),
                  Divider(),
                  CreateFIS_Scale(question: '25.告诉他(她)我需要什么，我会感到不舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '26.我害怕在对感情的投入方面他(她)比我投入的多'),
                  Divider(),
                  CreateFIS_Scale(question: '27.和他(她)开放坦诚的沟通我会感到不舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '28.有时听他(她)谈论私人的问题时，我会感到不舒服'),
                  Divider(),
                  CreateFIS_Scale(question: '29.在他(她)面前我不能很自然的做我自己'),
                  Divider(),
                  CreateFIS_Scale(question: '30.我和他(她)在一起以及一块讨论我们的个人目标，让我感到不轻松'),
                  Divider(),
                  CreateFIS_Scale(question: '31.我曾躲避一些亲近某人的机会'),
                  Divider(),
                  CreateFIS_Scale(question: '32.在以前的关系中，我曾抑制自己的情感表达'),
                  Divider(),
                  CreateFIS_Scale(question: '33.有人认为我不敢与他们亲近'),
                  Divider(),
                  CreateFIS_Scale(question: '34.有人认为我不是一个容易相处并被人了解的人'),
                  Divider(),
                  CreateFIS_Scale(question: '35.在以往的人际关系中，我曾阻止自己与他人建立亲密关系'),],
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
                  Get.to(FIS_check(), arguments: score_FIS);
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
