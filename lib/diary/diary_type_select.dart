import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heart_voyage_new/diary/XINXIE_msg.dart';
import 'package:heart_voyage_new/diary/new_diary.dart';
import 'package:heart_voyage_new/diary/treehole.dart';
import 'package:heart_voyage_new/meditation/XINXIE.dart';

class diary_type_select extends StatefulWidget {
  const diary_type_select({super.key});

  @override
  State<diary_type_select> createState() => _diary_type_selectState();
}

class _diary_type_selectState extends State<diary_type_select> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('选择日记形式'),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              SizedBox(height: 10),
              Center(
                child: Text(
                  '请在下面选择新添加的日记形式。',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.08,
                    0,
                    MediaQuery.of(context).size.width * 0.08,
                    0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(new_diary());
                  },
                  child: Center(
                    child: Text(
                      '添加到我的日记本',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(251, 231, 187, 1)),
                    foregroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(255, 153, 148, 1)),
                    minimumSize: MaterialStateProperty.all(Size(
                        MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        /*side: BorderSide(
                        color: Color.fromRGBO(90, 66, 53, 1), width: 2.0),*/
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.08,
                    0,
                    MediaQuery.of(context).size.width * 0.08,
                    0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(XINXIE_msg());
                  },
                  child: Center(
                    child: Text(
                      '投递至北大心协',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(251, 231, 187, 1)),
                    foregroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(255, 153, 148, 1)),
                    minimumSize: MaterialStateProperty.all(Size(
                        MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        /*side: BorderSide(
                        color: Color.fromRGBO(90, 66, 53, 1), width: 2.0),*/
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.fromLTRB(
                    MediaQuery.of(context).size.width * 0.08,
                    0,
                    MediaQuery.of(context).size.width * 0.08,
                    0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(treehole()); 
                  },
                  child: Center(
                    child: Text(
                      '随风而去吧',
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(251, 231, 187, 1)),
                    foregroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(255, 153, 148, 1)),
                    minimumSize: MaterialStateProperty.all(Size(
                        MediaQuery.of(context).size.width * 0.8,
                        MediaQuery.of(context).size.height * 0.1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        /*side: BorderSide(
                        color: Color.fromRGBO(90, 66, 53, 1), width: 2.0),*/
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(XINXIE());
                    },
                    child: Text('了解北大心协')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
