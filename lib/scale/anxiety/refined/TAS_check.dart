import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TAS_check extends StatefulWidget {
  const TAS_check({Key? key}) : super(key: key);

  @override
  State<TAS_check> createState() => TAS_checkState();
}

class TAS_checkState extends State<TAS_check> {
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
              Text('0-12分：较低水平。',style: TextStyle(fontSize: 20),),
              Text('12-20分：良好程度水平。',style: TextStyle(fontSize: 20),),
              Text('20分以上：较高水平。',style: TextStyle(fontSize: 20),),
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
