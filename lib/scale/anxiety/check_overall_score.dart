import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../system/userdata.dart';
import '../../tabs.dart';

class check_overall_score extends StatefulWidget {
  const check_overall_score({Key? key}) : super(key: key);

  @override
  State<check_overall_score> createState() => _check_overall_scoreState();
}

class _check_overall_scoreState extends State<check_overall_score> {
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
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                '0-4分：没有焦虑症，请注意自我保重。',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '5-9分：可能有轻微焦虑症，建议您咨询心理医生或心理医学工作者。',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '10-13分：可能有中度焦虑症，您最好咨询心理医生或心理医学工作者。',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '14-18分：可能有中重度焦虑症，建议您咨询心理医生或精神科医生。',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '19-21分：可能有重度焦虑症，请一定要看心理医生或精神科医生。',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '您的焦虑分数为',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "${score} 分",
                  style: TextStyle(fontSize: 50),
                ),
                style: ButtonStyle(

                ),
              ),
              // Container(
              //   alignment: Alignment.center,
              //   margin: EdgeInsets.fromLTRB(
              //       MediaQuery.of(context).size.width * 0.15,
              //       5,
              //       MediaQuery.of(context).size.width * 0.15,
              //       5),
              //   decoration: BoxDecoration(
              //     color: Color.fromRGBO(224, 167, 63, 1),
              //     border: Border.all(width: 0.5),
              //     borderRadius: BorderRadius.all(Radius.circular(10)),
              //   ),
              //   child: Text(
              //     "${score}分",
              //     style: TextStyle(fontSize: 50),
              //   ),
              // ),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * 0.2,
                      20,
                      MediaQuery.of(context).size.width * 0.2,
                      0),
                  child: ElevatedButton(
                      /*style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(215, 169, 83, 1)),
                      foregroundColor: MaterialStateProperty.all(Color.fromRGBO(90, 66, 53, 1)),
                      minimumSize: MaterialStateProperty.all(Size(
                          MediaQuery.of(context).size.width * 0.8,
                          MediaQuery.of(context).size.height * 0.1)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                          side: BorderSide(color: Color.fromRGBO(90, 66, 53, 1),width: 2.0),
                        ),
                      ),
                    ),*/
                      onPressed: () {
                        final _last_time_anxiety_box = GetStorage();
                        var _now = DateTime.now();
                        int _nowTime = _now.millisecondsSinceEpoch;
                        _last_time_anxiety_box.write(
                            'last_time_anxiety', _nowTime);
                        print("$basicData");
                        Get.offAll(tabs());
                      },
                      child: Text(
                        "返回到主页面",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ))),
            ],
          ),
        ));
  }
}
