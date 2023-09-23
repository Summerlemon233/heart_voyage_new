import 'package:flutter/material.dart';

class anxiety_instruction extends StatefulWidget {
  const anxiety_instruction({Key? key}) : super(key: key);

  @override
  State<anxiety_instruction> createState() => _anxiety_instructionState();
}

class _anxiety_instructionState extends State<anxiety_instruction> {
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

        child: Center(
          child: Text(

            "广泛性焦虑量表GAD-7是广泛用于临床的量表，用于评估焦虑情绪，定期（1次/1-2周）自评可以观察焦虑情绪变化趋势和治疗效果。\n\n"
            "没有 0分； \n有几天 1分； \n一半以上时间 2分； \n几乎天天 3分；\n\n"
            "总分为1~7题所选答案对应数字的总和。\n"
            "为了您测试结果的准确性和科学性，我们每周仅提供一次填写本量表的机会，请您谨慎填写。\n\n",
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontFamily: "FZ_Kaiti"),
            textAlign:  TextAlign.center,
          ),
        ),
        //margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
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
