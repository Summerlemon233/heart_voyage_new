import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:heart_voyage_new/pages/diary.dart';
import 'package:heart_voyage_new/pages/meditation.dart';
import 'package:heart_voyage_new/pages/pet.dart';
import 'package:heart_voyage_new/pages/scale.dart';
import 'package:heart_voyage_new/system/settings.dart';
import 'package:heart_voyage_new/system/sign.dart';
import 'package:heart_voyage_new/system/userdata_func.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'pages/map.dart';
import 'system/login.dart';
import 'system/userdata.dart';

class tabs extends StatefulWidget {
  const tabs({super.key});

  @override
  State<tabs> createState() => _tabsState();
}

class _tabsState extends State<tabs> {
  @override
  void initState() {
    initializeDateFormatting();
    loadBasicData();
    WidgetsBinding.instance.addPostFrameCallback((_){
      final _loginStateValidator = GetStorage();
      if(_loginStateValidator.read('isLogin') == null || _loginStateValidator.read('isLogin') == false)
      {
        Get.offAll(login());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Stack(
                  children: [
                    Image(image: AssetImage('assets/images/main_bkgnd.png')),
                    Positioned(
                        left: MediaQuery.of(context).size.width * 1.189,
                        top: MediaQuery.of(context).size.height * 0.074,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Get.to(map());
                            });
                          },
                          child: Container(
                            height: 210,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/map_object.png'))),
                          ),
                        )),
                    Positioned(
                        left: MediaQuery.of(context).size.width * 0.44,
                        top: MediaQuery.of(context).size.height * 0.52,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              Get.to(pet());
                            });
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/rabbit.png'))),
                          ),
                        )),
                    Positioned(
                      left: MediaQuery.of(context).size.width * 0.1,
                      bottom: MediaQuery.of(context).size.height * 0.04,
                      child: IconButton(
                        onPressed: () {
                          Get.to(settings());
                        },
                        icon: Icon(
                          Icons.settings,
                          size: 40,
                          color: Colors.pink,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(child: Container()),
          Positioned(
              left: 13,
              //right: 5,
              top: 25,
              //bottom: 5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Get.to(sign());
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                          color: Color.fromARGB(255, 111, 54, 34), width: 1.5)),
                  height: 60,
                  width: 60,
                  child: /*ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: (){},
              child: */
                      /*Container(
                  height: 150,
                  width: 150,
                  child: */
                      ListView(
                    children: [
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/sign_icon.png'),
                              fit: BoxFit.contain),
                        ),
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Center(
                        child: Text(
                          "打  卡",
                          style: TextStyle(
                              fontFamily: 'Smiley Sans',
                              color: Color.fromARGB(255, 111, 54, 34),
                              fontSize: 11),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
              left: 100,
              //right: 5,
              top: 25,
              //bottom: 5,
              child: GestureDetector(
                onTap: () => Get.to(meditation()),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                          color: Color.fromARGB(255, 111, 54, 34), width: 1.5)),
                  height: 60,
                  width: 60,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/meditation_icon.png'),
                              fit: BoxFit.contain),
                        ),
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Center(
                        child: Text(
                          "冥  想",
                          style: TextStyle(
                              fontFamily: 'Smiley Sans',
                              color: Color.fromARGB(255, 111, 54, 34),
                              fontSize: 11),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
              left: 187,
              //right: 5,
              top: 25,
              //bottom: 5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    Get.to(diary());
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                          color: Color.fromARGB(255, 111, 54, 34), width: 1.5)),
                  height: 60,
                  width: 60,
                  child: /*ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: (){},
              child: */
                      /*Container(
                  height: 150,
                  width: 150,
                  child: */
                      ListView(
                    children: [
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/diary_icon.png'),
                              fit: BoxFit.contain),
                        ),
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Center(
                        child: Text(
                          "日  记",
                          style: TextStyle(
                              fontFamily: 'Smiley Sans',
                              color: Color.fromARGB(255, 111, 54, 34),
                              fontSize: 11),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Positioned(
              left: 274,
              //right: 5,
              top: 25,
              //bottom: 5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    init_data();
                    Get.to(scale());
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(
                          color: Color.fromARGB(255, 111, 54, 34), width: 1.5)),
                  height: 60,
                  width: 60,
                  child: /*ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
                backgroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: (){},
              child: */
                      /*Container(
                  height: 150,
                  width: 150,
                  child: */
                      ListView(
                    children: [
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/scale_icon.png'),
                              fit: BoxFit.contain),
                        ),
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Center(
                        child: Text(
                          "量  表",
                          style: TextStyle(
                              fontFamily: 'Smiley Sans',
                              color: Color.fromARGB(255, 111, 54, 34),
                              fontSize: 11),
                        ),
                      )
                    ],
                  ),
                ),
              )),

          //ElevatedButton(onPressed: (){}, child: Container()),
        ],
      )),
    );
  }
}
