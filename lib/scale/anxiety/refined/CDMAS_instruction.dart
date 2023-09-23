import 'package:flutter/material.dart';

class CDMAS_instruction extends StatefulWidget {
  const CDMAS_instruction({Key? key}) : super(key: key);

  @override
  State<CDMAS_instruction> createState() => _CDMAS_instructionState();
}

class _CDMAS_instructionState extends State<CDMAS_instruction> {
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
          children: [
            Text(
              "       CDMAS 大学生择业焦虑量表 (Career Decision-Making Anxiety Scale)\n       CDMAS量表由美国心理学家布莱德利·C·科尼斯（Bradley C. Conyne）于1982年开发，并在后来的研究中进行了修订和改进。CDMAS量表包含了18个项目，个体根据自身的情况在每个项目上选择最符合自己的回答选项，用于评估其在择业决策过程中的焦虑水平。CDMAS量表主要包括以下几个维度：职业选择的焦虑、职业选择的不确定性、职业选择的犹豫和担忧。每个项目的回答选项通常是按照频率或程度进行评定，例如从“从不”到“经常”、从“无”到“很严重”等。\n       “从不”选择0分，“偶尔”选择1分，“有时”选择2分，“经常”选择3分，“总是”选择4分，然后将各项得分相加得到总分。\n       总分范围：0-18分：较低的择业焦虑水平。\n       总分范围：19-36分：中等程度的择业焦虑水平。\n       总分范围：37-54分：较高的择业焦虑水平。\n       总分范围：55及以上：严重的择业焦虑水平。",
              style: TextStyle(
                  fontSize: 18, color: Colors.black, fontFamily: "FZ_Kaiti"),
            ),
          ],
        ),
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
