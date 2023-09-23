import 'package:flutter/material.dart';

class FIS_instruction extends StatefulWidget {
  const FIS_instruction({Key? key}) : super(key: key);

  @override
  State<FIS_instruction> createState() => _FIS_instructionState();
}

class _FIS_instructionState extends State<FIS_instruction> {
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
            "       亲密关系焦虑量表是一种用于评估个体在亲密关系中对亲密性和亲密关系的焦虑程度的量表。\n       FIS量表最初由美国心理学家德里克·鲁斯顿（Derek Rubin）和莫里斯·皮尔曼（Morris A. Pierce）于1970年开发，并经过后来的研究者进行修订和改进。总分范围从0分到140分，分数越高表示个体在亲密关系中的焦虑程度越严重。\n       总分范围：0-35分：较低的亲密关系焦虑水平。\n       总分范围：36-70分：中等程度的亲密关系焦虑水平。\n       总分范围：71-105分：较高的亲密关系焦虑水平。\n       总分范围：106-140分：严重的亲密关系焦虑水平。"
            ,style: TextStyle(fontSize: 18,color: Colors.black,fontFamily: "FZ_Kaiti"),
          ),),
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
