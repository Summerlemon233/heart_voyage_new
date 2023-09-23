import 'package:flutter/material.dart';

class ASMC_instruction extends StatefulWidget {
  const ASMC_instruction({Key? key}) : super(key: key);

  @override
  State<ASMC_instruction> createState() => _ASMC_instructionState();
}

class _ASMC_instructionState extends State<ASMC_instruction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('详细信息'),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
      ),
      body: Container(

        child: ListView(
          children: [Text(
            "       依恋（attachment），是上世纪六十年代英国心理学家鲍尔比（John Bowlby）提出来的，原本用来解释婴儿与养育者之间的情感联系。\n       1978年，他的学生Mary Ainsworth在此基础上提出了婴儿的三种依恋类型：安全型（Secure）、焦虑-矛盾型（Anxious-ambivalent）、回避型（Avoidant）。\n       安全型依恋：当婴儿需要照顾时，养育者总是及时回应的话，婴儿就会感受到安全、爱和自信，表现得更爱笑，不拘谨，容易交往。面对新环境勇于探索，并会寻求养育者的支持。\n       焦虑-矛盾型依恋：当婴儿需要照顾时，养育者是否回应是不确定的，婴儿会努力找寻，表现得更容易紧张和过度依赖。面对新环境大哭大闹，不敢面对。\n       回避型依恋：当婴儿需要照顾时，养育者总不回应，态度冷漠，婴儿会陷入抑郁，表现得充满怀疑，无法信任他人。害怕也不会向养育者求助或寻找安慰。\n       后来研究者发现成年人在亲密关系中也有类似表现，且与幼儿时期的依恋模式基本一致。到1990 年，人际关系专家巴塞洛缪（Bartholomew）在婴儿的三种依恋类型的基础上，提出成年人的四种依恋类型。\n       这四种依恋类型是根据两个维度的变化区分出来的。一个维度是“回避”，一个维度是“焦虑”。高回避者与人亲密时容易感到不安，低回避者与人亲密时感觉轻松。高焦虑者害怕爱人不关注自己，或因为自己不够好而离开，低焦虑者则不担心这些。\n       两个维度高低组合出来的四种依恋风格是：安全型(Secure)、痴迷型(Preoccupied)、疏离型(Dismissing-Avoidant)、恐惧型(Fearful-Avoidant)。除了安全型，其它三种可以合称为不安全型。"
            ,style: TextStyle(fontSize: 18,color: Colors.black,fontFamily: "FZ_Kaiti"),
          ),]),
        height: MediaQuery.of(context).size.height * 0.8,

        margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        //width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 251, 231, 187),
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
      ),
    );
  }
}
