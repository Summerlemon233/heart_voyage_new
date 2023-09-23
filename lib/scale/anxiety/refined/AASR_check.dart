import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AASR_check extends StatefulWidget {
  const AASR_check({Key? key}) : super(key: key);

  @override
  State<AASR_check> createState() => _AASR_checkState();
}

class _AASR_checkState extends State<AASR_check> {
  final List<int> _args = Get.arguments;
  late int score1;
  late int score2;
  @override
  void initState() {
    double _tmp =  (_args[0] + _args[1])/12;
    score1 = _tmp.toInt();
    score2 = _args[2];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 252, 223, 215),
        appBar: AppBar(
          title: Text('查看分数'),
          backgroundColor: Color.fromARGB(255, 255, 189, 177),
          foregroundColor: Colors.white,
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Text('安全型:亲近依赖均分>3,且焦虑均分<3。',style: TextStyle(fontSize: 20),),
              Text('先占型:亲近依赖均分>3,且焦虑均分>3。',style: TextStyle(fontSize: 20),),
              Text('拒绝型:亲近依赖均分<3,且焦虑均分<3。',style: TextStyle(fontSize: 20),),
              Text('恐惧型;亲近依赖均分<3,且焦虑均分>3。',style: TextStyle(fontSize: 20),),
              SizedBox(height: 30,),
              Text('你的亲近依赖均分和焦虑均分分别为',style: TextStyle(fontSize: 30),),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(224, 167, 63, 1),
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("${score1}  ${score2}分",style: TextStyle(fontSize: 50),),
              ),
            ],
          ),
        )

    );
  }
}
