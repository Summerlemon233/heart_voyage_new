import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ITS_instruction.dart';

class CreateITS_Scale extends StatefulWidget {
  final String question;

  CreateITS_Scale({Key? key, required this.question}) : super(key: key);

  @override
  State<CreateITS_Scale> createState() => _CreateITS_ScaleState();
}

class _CreateITS_ScaleState extends State<CreateITS_Scale> {
  String? _groupValue = "完全同意";
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
              '完全同意',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "完全同意",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_ITS -= _deltaValue;
                    _deltaValue = 1;
                    score_ITS += _deltaValue;
                  });
                }),
            Text(
              '部分同意',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "部分同意",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_ITS -= _deltaValue;
                    _deltaValue = 2;
                    score_ITS += _deltaValue;
                  });
                })
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '同意与不同意相等',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "同意与不同意相等",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_ITS -= _deltaValue;
                    _deltaValue = 3;
                    score_ITS += _deltaValue;
                  });
                }),
            Text(
              '部分不同意',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "部分不同意",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_ITS -= _deltaValue;
                    _deltaValue = 4;
                    score_ITS += _deltaValue;
                  });
                }),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '完全不同意',
              style: TextStyle(fontFamily: 'FZ_Kaiti'),
            ),
            Radio(
                value: "完全不同意",
                groupValue: _groupValue,
                onChanged: (value) {
                  setState(() {
                    _groupValue = value;
                    score_ITS -= _deltaValue;
                    _deltaValue = 5;
                    score_ITS += _deltaValue;
                  });
                })
          ],
        )
      ],
    );
    ;
  }
}

int score_ITS = 0;

class ITS_scale extends StatefulWidget {
  const ITS_scale({Key? key}) : super(key: key);

  @override
  State<ITS_scale> createState() => _ITS_scaleState();
}

class _ITS_scaleState extends State<ITS_scale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 252, 223, 215),
        appBar: AppBar(
          title: Text('人际信任量表'),
          backgroundColor: Color.fromARGB(255, 255, 189, 177),
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Container(
              //height: MediaQuery.of(context).size.height * 0.8,
              child: SafeArea(
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
                                Get.to(() => ITS_instruction());
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
                          CreateITS_Scale(question: '1.在我们这个社会里虚伪的现象越来越多了'),
                          Divider(),
                          CreateITS_Scale(question: '2.与陌生人打交道时，你最好小心,除非他们拿出可以证明其值得信任的依据'),
                          Divider(),
                          CreateITS_Scale(question: '3.除非我们吸引更多的人进人政界,否则这个国家的前途将十分黯淡'),
                          Divider(),
                          CreateITS_Scale(question: '4.阻止多数人触犯法律的是恐惧,社会廉耻或惩罚而不是良心'),
                          Divider(),
                          CreateITS_Scale(question: '5.考试时老师不到场监考可能会导致更多的人作弊'),
                          Divider(),
                          CreateITS_Scale(question: '6.通常父母在遵守诺言方面是可以信赖的'),
                          Divider(),
                          CreateITS_Scale(question: '7.联合国永远也不会成为维持世界和平的有效力量'),
                          Divider(),
                          CreateITS_Scale(question: '8.法院是我们都能受到公正对待的场所'),
                          Divider(),
                          CreateITS_Scale(question: '9.如果得知公众听到和看到的新闻有多少已被歪曲,多数人会感到震惊的'),
                          Divider(),
                          CreateITS_Scale(question: '10.不管人们怎样表白,最好还是认为多数人主要关心其自身的幸福'),
                          Divider(),
                          CreateITS_Scale(question: '11.尽管在报纸、收音机和电视中均可看到新闻,但我们很难得到关于公共事件的客现报道'),
                          Divider(),
                          CreateITS_Scale(question: '12.未来和平很有希望'),
                          Divider(),
                          CreateITS_Scale(question: '13.如果真正了解到国际上正在发生的政治事件,那么公众有理由比现在更加担心'),
                          Divider(),
                          CreateITS_Scale(question: '14.多数获选官员在竞选中的许诺是诚恳的'),
                          Divider(),
                          CreateITS_Scale(question: '15.许多重大的全国性体育比赛均受到某种形式的操纵和利用'),
                          Divider(),
                          CreateITS_Scale(question: '16.多数专家有关其知识局限性的表白是可信的'),
                          Divider(),
                          CreateITS_Scale(question: '17.多数父母关于实施惩罚的威胁是可信的'),
                          Divider(),
                          CreateITS_Scale(question: '18.多数人如果说出自己的打算就一定会去实现'),
                          Divider(),
                          CreateITS_Scale(question: '19.在这个竞争的年代里，如果不保持警惕别人就可能占你的便宜'),
                          Divider(),
                          CreateITS_Scale(question: '20.多数理想主义者是诚恳的并按照他们自己所宜扬的信条行事'),
                          Divider(),
                          CreateITS_Scale(question: '21.多数推销人员在描述他们的产品时是诚实的'),
                          Divider(),
                          CreateITS_Scale(question: '22.多数学生即使在有把握不会被发现时也不作弊'),
                          Divider(),
                          CreateITS_Scale(question: '23.多数维修人员即使认为你不懂其专业知识也不会多收费'),
                          Divider(),
                          CreateITS_Scale(question: '24.对保险公司的控告有相当一部分是假的'),
                          Divider(),
                          CreateITS_Scale(question: '25.多数人诚实地回答民意测验中的问题'),
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
                          /* List<int> args = [score_AASR1, score_AASR2, score_AASR3];
    Get.to(AASR_check(), arguments: args);*/
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
              )),
        ));
  }
}
// SizedBox(
// height: 10,
// ),
//
// Text(
// '    使用以下标准表明你对下列每一陈述同意或不同意的程度',
// style: TextStyle(fontSize: 16),
// ),
//
//
//
// Divider(),

// Divider(),
// SizedBox(
// height: 10,
// ),
// SizedBox(
// width: 100,
// child: ElevatedButton(
// onPressed: () {
// /*basicData["moodscore"] = score_ITS;
//                   saveBasicData();*/
// //上面两注释掉，下面一行get内改成check。。。
// Get.to(ITS_check(), arguments: score_ITS);
// },
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(
// Color.fromRGBO(224, 167, 63, 1)),
// foregroundColor:
// MaterialStateProperty.all(Color.fromRGBO(90, 66, 53, 1)),
// ),
// child: Text(
// "点击查看分数",
// style: TextStyle(fontSize: 20),
// ),
// ),
// ),
// SizedBox(
// height: 30,
// ),
