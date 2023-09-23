import 'package:flutter/material.dart';

class ITS_instruction extends StatefulWidget {
  const ITS_instruction({Key? key}) : super(key: key);

  @override
  State<ITS_instruction> createState() => _ITS_instructionState();
}

class _ITS_instructionState extends State<ITS_instruction> {
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
            "       人际信任是个体将他人的言词、承诺以及口头或书面的陈述认为可靠的一种概括化的期望(Rotter,1967)。高信任者可能较少撒谎、作弊或偷窃。他们可能会更多地给他人第二次机会及尊重他人的正当权利。高信任者可能较少出现不快乐、与他人发生冲突或者环境适应不良，他们通常更讨人喜欢,并且不论是高信任者还是低信任者都愿把他们当作朋友(Rotter,1977)。\n       人际信任量表(interpersonal trust scale,ITS)由 Rotter JB于1967 年编制该量表用于测查受试者对他人的行为、承诺或(口头和书面)陈述的可靠性。"
            ,style: TextStyle(fontSize: 18,color: Colors.black,fontFamily: "FZ_Kaiti"),
          ),),
        height: MediaQuery.of(context).size.height * 0.6,

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
