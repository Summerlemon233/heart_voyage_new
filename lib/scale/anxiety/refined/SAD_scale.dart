import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './SAD_check.dart';


import '../anxiety_instruction.dart';
import 'SAD_instruction.dart';


class CreateSAD_Scale extends StatefulWidget {
  final String question;
  final int mode;

  CreateSAD_Scale({Key? key, required this.question,required this.mode}) : super(key: key);

  @override
  State<CreateSAD_Scale> createState() => _CreateSAD_ScaleState();
}

class _CreateSAD_ScaleState extends State<CreateSAD_Scale> {
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
              '是',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "是",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_SAD -= _deltaValue;
                    if(widget.mode == 1)
                    _deltaValue = 1;
                    else _deltaValue = 0;
                    score_SAD += _deltaValue;
                  });
                }),
            Text(
              '否',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "否",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_SAD -= _deltaValue;
                    if(widget.mode == 1)
                      _deltaValue = 0;
                    else _deltaValue = 1;
                    score_SAD += _deltaValue;
                  });
                })
          ],
        )
      ],
    );
  }
}

int score_SAD = 0;

class SAD_scale extends StatefulWidget {
  const SAD_scale({Key? key}) : super(key: key);

  @override
  State<SAD_scale> createState() => _SAD_scaleState();
}

class _SAD_scaleState extends State<SAD_scale> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('SAD量表'),
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
                        Get.to(() => SAD_instruction());
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
                    '    请选择你认为最符合的选项。',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
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
                  CreateSAD_Scale(question: '1.即使在不熟悉的社交场合里我仍然感到放松',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '2.我尽量避免迫使我参加交际应酬的情形',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '3.我同陌生人在一起时很容易放松',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '4.我并不特别想去回避人们',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '5.我通常感觉社交场合令人心烦意乱',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '6.在社交场合我通常感觉平静及舒适',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '7.在同异性交谈时，我通常感觉放松',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '8.我尽量避免与别人讲话，除非特别熟',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '9.如果有同新人相会的机会，我会抓住的',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '10.在非正式的聚会上如有异性参加，我通常觉得焦虑和紧张',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '11.我与人们在一起时通常感到焦虑，除非与他们特别熟',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '12.我与一群人在一起时通常感到很放松',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '13.我经常想离开人群',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '14.在置身于不认识的人群中时，我通常感到不自在',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '15.在初次遇到某些人时,我通常是放松的',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '16.当被介绍给别人时，我会感到紧张和焦虑',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '17.尽管满房间都是陌生人，我可能还是会进去的',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '18.我会避免走进去并加人到一大群人中间',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '19.当上司想同我谈话时，我很高兴与他谈话',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '20.当与一群人在一起时，我通常感觉忐忑不安',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '21.我喜欢躲开人群',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '22.在晚上或社交聚会上与人们交谈对我不成问题',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '23.在一大群人中间.我极少能感到自在',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '24.我经常想出一些借口以回避社交活动',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '25.我有时充当为人们相互介绍的角色',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '26.我尽量避开正式的社交场合',mode:1),
                  Divider(),
                  CreateSAD_Scale(question: '27.我通常参加我所能参加的各种社会交往，不管是什么社交活动我一般是能去就去',mode:2),
                  Divider(),
                  CreateSAD_Scale(question: '28.我发现同他人在一起时放松很容易',mode:2),
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
                  /*basicData["moodscore"] = score_TAS;
                  saveBasicData();
                  //上面两注释掉，下面一行get内改成check。。。*/
                  Get.to(SAD_check(), arguments: score_SAD);
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


