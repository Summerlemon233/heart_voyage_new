import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './TAS_check.dart';
import './TAS_instruction.dart';
import '../../../system/userdata.dart';
import '../../../system/userdata_func.dart';

import '../anxiety_instruction.dart';


class CreateTAS_Scale extends StatefulWidget {
  final String question;
  final int mode;
  CreateTAS_Scale({Key? key, required this.question,required this.mode}) : super(key: key);

  @override
  State<CreateTAS_Scale> createState() => _CreateTAS_ScaleState();
}

class _CreateTAS_ScaleState extends State<CreateTAS_Scale> {
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
              '有',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "有",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_TAS -= _deltaValue;
                    if(widget.mode == 1)
                       _deltaValue = 1;
                    else _deltaValue = 0;
                    score_TAS += _deltaValue;
                  });
                }),
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
                    score_TAS -= _deltaValue;
                    if(widget.mode == 1)
                      _deltaValue = 0;
                    else _deltaValue = 1;
                    score_TAS += _deltaValue;
                  });
                })
            ],
        )
      ],
    );
  }
}

int score_TAS = 0;

class TAS_scale extends StatefulWidget {
  const TAS_scale({Key? key}) : super(key: key);

  @override
  State<TAS_scale> createState() => _TAS_scaleState();
}

class _TAS_scaleState extends State<TAS_scale> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('考试焦虑量表'),
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
                        Get.to(() => TAS_instruction());
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
                    '    在过去的生活里，面对考试你是否有如下现象？请选择你认为最符合的选项。',
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
                  CreateTAS_Scale(question: '1.当一次重大考试就要来临时，我总是在想别人比我聪明得多',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '2.如果我将要做一次智力测试，在做之前我会非常焦虑 ',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '3.如果我知道将会有一次智力测试，在此之前会感到很自信，很轻松',mode:2),
                  Divider(),
                  CreateTAS_Scale(question: '4.参加重大考试时，我会出很多汗',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '5.考试期间，我发现自己总是在想一些与考试内容无关的事',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '6.当一次突击式的考试来到时，我感到很怕',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '7.考试期问我经常想到会失败',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '8.重大考试后，我经常感到紧张，以至胃不舒服',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '9.我对智力考试和期末考试之类的事感到发怵',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '10.在一次考试中取得好成绩似乎并不能增加我在第二次考试中的信心',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '11.在重大考试期间，我有时感到心跳很快',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '12.考试完毕后我总是觉得可以比实际上做得更好',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '13.考试完毕后我总是感到很抑郁',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '14.每次期未考试之前，我总有一种紧张不安的感觉',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '15.在考试时，我不会受到情绪的影响',mode:2),
                  Divider(),
                  CreateTAS_Scale(question: '16.考试期间，我经常很紧张，以致本来知道的东西也忘了',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '17.复习需要的考试对我来说似乎是一个很大的挑战',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '18.在复习时我越努力，似乎就感到越糊涂',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '19.考试一结束我就努力不再去想它，但我却总是做不到',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '20.在考试时候我有时会怀疑自己究竟能否考上大学',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '21.我希望课程以写论文等形式代替考试来计成绩',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '22.我真希望考试不要像现在这样令我担忧',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '23.我相信，如果我单独参加考试而且没有时间限制的话，我会考得更好',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '24.想着我在考试中能得多少分会干扰我的复习和考试',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '25.如果考试能废除的活，我想我能学得更多',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '26.我对考试抱着这样的态度：“虽然我现在不懂，但我并不担心"',mode:2),
                  Divider(),
                  CreateTAS_Scale(question: '27.我真不明白为什么有些人对考试那么紧张',mode:2),
                  Divider(),
                  CreateTAS_Scale(question: '28.担心考不好的想法影响了我在考试中的发挥',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '29.我复习期末考试并不比复习平时考试更卖力',mode:2),
                  Divider(),
                  CreateTAS_Scale(question: '30.尽管我对某门考试复习很好，但我依然感到焦感',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '31.在重大考试之前，我的胃口会不好',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '32.在重大考试前，我发现我的手臂会颤抖',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '33.在考试的，我很少有 “临时抱佛脚”的需要',mode:2),
                  Divider(),
                  CreateTAS_Scale(question: '34.校方应该认识到有些学生对考试较为焦虑，而这会影响他们的考试成绩',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '35.我认为，考试期间不应该搞得那么紧张',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '36.在马上就要得知考试成绩时，我感到非常心神不宁',mode:1),
                  Divider(),
                  CreateTAS_Scale(question: '37.如果某位老师有突然测验的习惯，我会害怕上他（或她）教的课',mode:1),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  /*basicData["moodscore"] = score_TAS;
                  saveBasicData();
                  //上面两注释掉，下面一行get内改成check。。。*/
                  Get.to(TAS_check(), arguments: score_TAS);
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


