import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './refined/AASR_scale.dart';
import './refined/AAT_scale.dart';
import './refined/ASMC_scale.dart';
import './refined/CDMAS_scale.dart';
import './refined/FIS_scale.dart';
import './refined/ITS_scale.dart';
import './refined/TAS_scale.dart';
//import 'package:heart_voyage/pages/heart/anxiety/refined/graduate_anxiety_scale.dart';

import 'refined/SAD_scale.dart';



class refined_judge extends StatefulWidget {
  const refined_judge({Key? key}) : super(key: key);

  @override
  State<refined_judge> createState() => _refined_judgeState();
}

class _refined_judgeState extends State<refined_judge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 223, 215),
      appBar: AppBar(
        title: Text('焦虑水平细化评价'),
        backgroundColor: Color.fromARGB(255, 255, 189, 177),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(AASR_scale());
              },
              child: Text(
                "AASR量表",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(251, 231, 187, 1)),
                foregroundColor:
                MaterialStateProperty.all(Color.fromRGBO(255, 153, 148, 1)),
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
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(AAT_scale());
              },
              child: Text(
                "AAT量表",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(251, 231, 187, 1)),
                foregroundColor:
                MaterialStateProperty.all(Color.fromRGBO(255, 153, 148, 1)),
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
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(ASMC_scale());
              },
              child: Text(
                "ASMC量表",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(251, 231, 187, 1)),
                foregroundColor:
                MaterialStateProperty.all(Color.fromRGBO(255, 153, 148, 1)),
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
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(SAD_scale());
              },
              child: Text(
                "SAD量表",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(Color.fromRGBO(251, 231, 187, 1)),
        foregroundColor:
        MaterialStateProperty.all(Color.fromRGBO(255, 153, 148, 1)),
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
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(ITS_scale());
              },
              child: Text(
                "ITS量表",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(251, 231, 187, 1)),
                foregroundColor:
                MaterialStateProperty.all(Color.fromRGBO(255, 153, 148, 1)),
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
            /*SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () {
                  Get.to(MAQ_scale());
                },
                child: Text("MAQ量表",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(215, 169, 83, 1)),
                foregroundColor:
                MaterialStateProperty.all(Color.fromRGBO(90, 66, 53, 1)),
                minimumSize: MaterialStateProperty.all(Size(
                    MediaQuery.of(context).size.width * 0.8,
                    MediaQuery.of(context).size.height * 0.1)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: BorderSide(
                        color: Color.fromRGBO(90, 66, 53, 1), width: 2.0),
                  ),
                ),
              ),),*/
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(TAS_scale());
              },
              child: Text(
                "TAS量表",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(251, 231, 187, 1)),
                foregroundColor:
                MaterialStateProperty.all(Color.fromRGBO(255, 153, 148, 1)),
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
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(CDMAS_scale());
              },
              child: Text(
                "CDMAS量表",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(251, 231, 187, 1)),
                foregroundColor:
                MaterialStateProperty.all(Color.fromRGBO(255, 153, 148, 1)),
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
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(FIS_scale());
              },
              child: Text(
                "FIS量表",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(Color.fromRGBO(251, 231, 187, 1)),
                foregroundColor:
                MaterialStateProperty.all(Color.fromRGBO(255, 153, 148, 1)),
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
            SizedBox(height: 60),

          ],
        ),
      )),
    );
  }
}
