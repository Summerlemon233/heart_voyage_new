import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CDMAS_check extends StatefulWidget {
  const CDMAS_check({Key? key}) : super(key: key);

  @override
  State<CDMAS_check> createState() => CDMAS_checkState();
}

class CDMAS_checkState extends State<CDMAS_check> {
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
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Text('0-18分：较低的择业焦虑水平。',style: TextStyle(fontSize: 20),),
              Text('19-36分：中等程度的择业焦虑水平。',style: TextStyle(fontSize: 20),),
              Text('37-54分：较高的择业焦虑水平。',style: TextStyle(fontSize: 20),),
              Text('55分及以上：严重的择业焦虑水平。',style: TextStyle(fontSize: 20),),
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
