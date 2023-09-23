
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ASMC_check extends StatefulWidget {
  const ASMC_check({Key? key}) : super(key: key);

  @override
  State<ASMC_check> createState() => ASMC_checkState();
}

class ASMC_checkState extends State<ASMC_check> {
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
              Text('13-26分：对自身外貌的认知和态度比较正常。',style: TextStyle(fontSize: 20),),
              Text('27-39分：对自身外貌有一定程度的不安和焦虑，需要适当关注和干预。',style: TextStyle(fontSize: 20),),
              Text('40-52分：对自身外貌的不安和焦虑比较明显，需要采取有效的干预措施。',style: TextStyle(fontSize: 20),),
              Text('53-65分：对自身外貌的不安和焦虑非常明显，需要尽早进行专业的心理干预。',style: TextStyle(fontSize: 20),),
              SizedBox(height: 30,),
              Text('你的总分数为',style: TextStyle(fontSize: 30),),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){},
                child: Text("${score} 分",style: TextStyle(fontSize: 50),),
              ),
            ],
          ),
        )

    );
  }
}
