import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AAT_check extends StatefulWidget {
  const AAT_check({Key? key}) : super(key: key);

  @override
  State<AAT_check> createState() => AAT_checkState();
}

class AAT_checkState extends State<AAT_check> {
  var score = Get.arguments;
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
              Text('积极作用9-45分：较低的亲密关系焦虑水平。',style: TextStyle(fontSize: 20),),
              Text('消极作用10-50分：中等程度的亲密关系焦虑水平。',style: TextStyle(fontSize: 20),),
              SizedBox(height: 30,),
              Text('你的积极作用和消极作用分数分别为',style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
              SizedBox(height: 10),
              ElevatedButton(onPressed: (){}, child: Text("${score[0]} 分、${score[1]} 分",style: TextStyle(fontSize: 50),),
             /* Container(
                padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(224, 167, 63, 1),
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text("${score[0]}分、${score[1]}分",style: TextStyle(fontSize: 50),),
              ),*/),
            ],
          ),
        )

    );
  }
}
