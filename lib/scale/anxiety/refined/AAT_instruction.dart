import 'package:flutter/material.dart';

class AAT_instruction extends StatefulWidget {
  const AAT_instruction({Key? key}) : super(key: key);

  @override
  State<AAT_instruction> createState() => _AAT_instructionState();
}

class _AAT_instructionState extends State<AAT_instruction> {
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
              "       学习适应性测验( Academic Adjustment Iventory,简称AAT )是用来测量学生克服内在和外在种种困难取得较好学习效果的学习适应能力的量表。该测验源自日本教育研究所学习适应性研究所编的《学习适应性测验》， 由我国心理测量专家进行了修订，并制订出中国的常模，成为适应于我国学生学习诊断与指导的标准化测验工具。本测验是目前我国心理健康教育中使用最多的学习相关量表。学生学习适应性测验由12个内容量表组成，包括: 1、学习热情:自己是否有积极性，主动地学习。2、 学习计划:是否有计划地学习。3、听课方法:是否积极听课，充分利用听课时间。 4、读书方法:读书效率高不高，是否记笔记，能否充分发挥笔记的作用。5、学习技术:记忆和思考方法好不好。6、 应试方法:考试前是否做好充分准备，考试时是否顺利，能否利用考试增进学习能力。7、家庭环境:是否充分利用了家庭的物质条件.家庭气氛是否有利于学习。8、 学校环境:是否积极利用学校环境增进学习。9、同学关系:同学关系是否有利于学习。10、 独立性:自己的事能否积极地自己去做。11、 毅力:做事能否坚持到最后完成。12、 身心健康:心理健康的程度如何,身体是否健康。"
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
